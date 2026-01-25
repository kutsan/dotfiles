local keymap = vim.keymap

-- Jump previous and next commands from history.
keymap.set('c', '<C-j>', '<Down>')
keymap.set('c', '<C-k>', '<Up>')

-- Construct substitute command with
keymap.set('c', ';s', 'substitute/\\v//gc<Left><Left><Left><Left>')

-- Construct global command with 'very magic' mode.
keymap.set('c', ';g', 'global/\\v/<Left>')

-- Construct search and replace.
keymap.set('c', ';r', 'substitute/<C-r>=@/<CR>//gce<Left><Left><Left><Left>')
keymap.set(
	'c',
	';R',
	'cdo substitute/<C-r>=@/<CR>//gce<Left><Left><Left><Left>'
)
