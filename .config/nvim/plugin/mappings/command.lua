local map = require('kutsan/utils').map

-- Jump previous and next commands from history.
map('c', '<C-j>', '<Down>')
map('c', '<C-k>', '<Up>')

-- Construct substitute command with
map('c', ';s', 'substitute/\\v//gc<Left><Left><Left><Left>')

-- Construct global command with 'very magic' mode.
map('c', ';g', 'global/\\v/<Left>')

-- Construct search and replace.
map('c', ';r', 'substitute/<C-r>=@/<CR>//gce<Left><Left><Left><Left>')
map('c', ';R', 'cdo substitute/<C-r>=@/<CR>//gce<Left><Left><Left><Left>')
