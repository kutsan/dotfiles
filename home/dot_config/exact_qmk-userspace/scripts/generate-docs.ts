#!/usr/bin/env node

import { execFileSync } from 'node:child_process'
import {
	existsSync,
	mkdirSync,
	readFileSync,
	readdirSync,
	rmSync,
	writeFileSync,
} from 'node:fs'
import { join } from 'node:path'

interface BuildTarget {
	keyboard: string
	keymap: string
}

const SCRIPT_DIR = import.meta.dirname
const USERSPACE_DIR = join(SCRIPT_DIR, '..')
const ASSETS_DIR = join(USERSPACE_DIR, 'assets')
const KEYMAP_CONFIG = join(SCRIPT_DIR, 'keymap-config.yaml')

const getKeymapPath = ({ keyboard, keymap }: BuildTarget): string =>
	join(
		USERSPACE_DIR,
		'exact_keyboards',
		...keyboard.split('/').map((part) => `exact_${part}`),
		'exact_keymaps',
		...keymap.split('/').map((part) => `exact_${part}`),
		'keymap.c',
	)

for (const requiredCommand of ['keymap', 'qmk']) {
	try {
		execFileSync('which', [requiredCommand])
	} catch (error) {
		throw new Error(`'${requiredCommand}' is not installed`, { cause: error })
	}
}

const qmkJsonContent: unknown = JSON.parse(
	readFileSync(join(USERSPACE_DIR, 'qmk.json'), 'utf-8'),
)

const rawBuildTargets =
	typeof qmkJsonContent === 'object' &&
	qmkJsonContent !== null &&
	'build_targets' in qmkJsonContent &&
	Array.isArray(qmkJsonContent.build_targets)
		? (qmkJsonContent.build_targets as unknown[])
		: []

const buildTargets = rawBuildTargets
	.filter((target): target is [string, string] => {
		if (!Array.isArray(target)) {
			return false
		}

		return typeof target[0] === 'string' && typeof target[1] === 'string'
	})
	.map(([keyboard, keymap]): BuildTarget => ({ keyboard, keymap }))

if (buildTargets.length === 0) {
	throw new Error('No build targets found in qmk.json')
}

mkdirSync(ASSETS_DIR, { recursive: true })

for (const file of readdirSync(ASSETS_DIR).filter((file) =>
	file.endsWith('.svg'),
)) {
	rmSync(join(ASSETS_DIR, file))
}

const results = buildTargets.map(({ keyboard, keymap }: BuildTarget) => {
	const keymapPath = getKeymapPath({ keyboard, keymap })

	if (!existsSync(keymapPath)) {
		throw new Error(`keymap.c not found at ${keymapPath}`)
	}

	const svgName = `${keyboard.replaceAll('/', '-')}-${keymap}.svg`
	process.stdout.write(`Generating SVG: ${keyboard} / ${keymap}\n`)

	const qmkKeymapJsonOutput = execFileSync('qmk', [
		'c2json',
		'--keyboard',
		keyboard,
		'--keymap',
		keymap,
		keymapPath,
	])

	const parsedKeymapRepresentationContent = execFileSync(
		'keymap',
		['parse', '--qmk-keymap-json', '-'],
		{
			input: qmkKeymapJsonOutput,
		},
	)
	const svgContent = execFileSync(
		'keymap',
		['--config', KEYMAP_CONFIG, 'draw', '-'],
		{
			input: parsedKeymapRepresentationContent,
		},
	)

	writeFileSync(join(ASSETS_DIR, svgName), svgContent)
	process.stdout.write(`\tSaved: assets/${svgName}\n`)

	return { keyboard, keymap, svgName }
})

writeFileSync(
	join(USERSPACE_DIR, 'README.md'),
	`

# Keymap

${results
	.map(({ keyboard, keymap, svgName }) =>
		`

## ${keyboard} (${keymap})

![${keyboard}](./assets/${svgName})

`.trim(),
	)
	.join('\n')}

`.trim(),
)

process.stdout.write('Generated: README.md\n')
