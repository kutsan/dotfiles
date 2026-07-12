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
const REPO_ROOT = join(SCRIPT_DIR, '..', '..')
const USERSPACE_DIR = join(
	REPO_ROOT,
	'home',
	'dot_config',
	'exact_qmk-userspace',
)
const ASSETS_DIR = join(REPO_ROOT, '.github', 'assets')
const README_PATH = join(REPO_ROOT, 'README.md')
const KEYMAP_CONFIG = join(SCRIPT_DIR, 'keymap-config.yaml')

const MARKER_START = '<!-- KEYBOARD-DOCS:START -->'
const MARKER_END = '<!-- KEYBOARD-DOCS:END -->'

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

for (const file of readdirSync(ASSETS_DIR).filter(
	(file) => file.startsWith('keyboard-') && file.endsWith('.svg'),
)) {
	rmSync(join(ASSETS_DIR, file))
}

const results = buildTargets.map(({ keyboard, keymap }: BuildTarget) => {
	const keymapPath = getKeymapPath({ keyboard, keymap })

	if (!existsSync(keymapPath)) {
		throw new Error(`keymap.c not found at ${keymapPath}`)
	}

	const svgName = `keyboard-${keyboard.replaceAll('/', '-')}-${keymap}.svg`
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
	process.stdout.write(`\tSaved: .github/assets/${svgName}\n`)

	return { keyboard, keymap, svgName }
})

const generatedSection = results
	.map(({ keyboard, keymap, svgName }) =>
		`
### ${keyboard} (${keymap})

![${keyboard}](.github/assets/${svgName})
`.trim(),
	)
	.join('\n\n')

const readme = readFileSync(README_PATH, 'utf-8')

const startIndex = readme.indexOf(MARKER_START)
const endIndex = readme.indexOf(MARKER_END)

if (startIndex === -1 || endIndex === -1 || endIndex < startIndex) {
	throw new Error(
		`Could not find marker pair '${MARKER_START}' … '${MARKER_END}' (in order) in ${README_PATH}`,
	)
}

if (
	readme.indexOf(MARKER_START, startIndex + MARKER_START.length) !== -1 ||
	readme.indexOf(MARKER_END, endIndex + MARKER_END.length) !== -1
) {
	throw new Error(
		`Found duplicate markers in ${README_PATH}; expected exactly one '${MARKER_START}' / '${MARKER_END}' pair`,
	)
}

const before = readme.slice(0, startIndex + MARKER_START.length)
const after = readme.slice(endIndex)

writeFileSync(README_PATH, `${before}\n\n${generatedSection}\n\n${after}`)

process.stdout.write('Updated: README.md\n')
