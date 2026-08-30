vim.pack.add({
	{
		name = 'treesitter-text-objects',
		src = 'github:nvim-treesitter/nvim-treesitter-textobjects',
	},
})

local tree_sitter_text_objects = require('nvim-treesitter-textobjects')

tree_sitter_text_objects.setup({
	select = {
		lookahead = true,
		include_surrounding_whitespace = function(object)
			local excluded_queries = {
				'@assignment.inner',
				'@assignment.outer',
				'@assignment.lhs',
				'@assignment.rhs',
				'@block.inner',
			}

			return not vim.tbl_contains(excluded_queries, object.query_string)
		end,
	},
	move = {
		set_jumps = true,
	},
})

local text_objects_move = require('nvim-treesitter-textobjects.move')
local text_objects_select_lib = require('nvim-treesitter-textobjects.select')
local text_objects_swap = require('nvim-treesitter-textobjects.swap')

local function text_objects_select(query)
	return function()
		text_objects_select_lib.select_textobject(query, 'textobjects')
	end
end

local keymap = vim.keymap

-- Select
keymap.set(
	{ 'x', 'o' },
	'is',
	text_objects_select('@assignment.inner'),
	{ desc = 'Inner assignment' }
)
keymap.set(
	{ 'x', 'o' },
	'as',
	text_objects_select('@assignment.outer'),
	{ desc = 'Outer assignment' }
)
keymap.set(
	{ 'x', 'o' },
	'i,',
	text_objects_select('@assignment.lhs'),
	{ desc = 'Assignment LHS' }
)
keymap.set(
	{ 'x', 'o' },
	'i.',
	text_objects_select('@assignment.rhs'),
	{ desc = 'Assignment RHS' }
)
keymap.set(
	{ 'x', 'o' },
	'ar',
	text_objects_select('@attribute.outer'),
	{ desc = 'Outer attribute' }
)
keymap.set(
	{ 'x', 'o' },
	'ir',
	text_objects_select('@attribute.inner'),
	{ desc = 'Inner attribute' }
)
keymap.set(
	{ 'x', 'o' },
	'a;',
	text_objects_select('@block.outer'),
	{ desc = 'Outer block' }
)
keymap.set(
	{ 'x', 'o' },
	'i;',
	text_objects_select('@block.inner'),
	{ desc = 'Inner block' }
)
keymap.set(
	{ 'x', 'o' },
	'ac',
	text_objects_select('@call.outer'),
	{ desc = 'Outer call' }
)
keymap.set(
	{ 'x', 'o' },
	'ic',
	text_objects_select('@call.inner'),
	{ desc = 'Inner call' }
)
keymap.set(
	{ 'x', 'o' },
	'aC',
	text_objects_select('@class.outer'),
	{ desc = 'Outer class' }
)
keymap.set(
	{ 'x', 'o' },
	'iC',
	text_objects_select('@class.inner'),
	{ desc = 'Inner class' }
)
keymap.set(
	{ 'x', 'o' },
	'az',
	text_objects_select('@comment.outer'),
	{ desc = 'Outer comment' }
)
keymap.set(
	{ 'x', 'o' },
	'iz',
	text_objects_select('@comment.inner'),
	{ desc = 'Inner comment' }
)
keymap.set(
	{ 'x', 'o' },
	'af',
	text_objects_select('@function.outer'),
	{ desc = 'Outer function' }
)
keymap.set(
	{ 'x', 'o' },
	'if',
	text_objects_select('@function.inner'),
	{ desc = 'Inner function' }
)
keymap.set(
	{ 'x', 'o' },
	'aa',
	text_objects_select('@parameter.outer'),
	{ desc = 'Outer parameter' }
)
keymap.set(
	{ 'x', 'o' },
	'ia',
	text_objects_select('@parameter.inner'),
	{ desc = 'Inner parameter' }
)

-- Swap
keymap.set('n', 'g>a', function()
	text_objects_swap.swap_next('@parameter.inner')
end, { desc = 'Swap next parameter' })
keymap.set('n', 'g<a', function()
	text_objects_swap.swap_previous('@parameter.inner')
end, { desc = 'Swap previous parameter' })
keymap.set('n', 'g>r', function()
	text_objects_swap.swap_next('@attribute.outer')
end, { desc = 'Swap next attribute' })
keymap.set('n', 'g<r', function()
	text_objects_swap.swap_previous('@attribute.outer')
end, { desc = 'Swap previous attribute' })
keymap.set('n', 'g>f', function()
	text_objects_swap.swap_next('@function.outer')
end, { desc = 'Swap next function' })
keymap.set('n', 'g<f', function()
	text_objects_swap.swap_previous('@function.outer')
end, { desc = 'Swap previous function' })

-- Move
keymap.set({ 'n', 'x', 'o' }, ']f', function()
	text_objects_move.goto_next_start('@function.outer', 'textobjects')
end, { desc = 'Next function start' })
keymap.set({ 'n', 'x', 'o' }, '[f', function()
	text_objects_move.goto_previous_start('@function.outer', 'textobjects')
end, { desc = 'Previous function start' })
keymap.set({ 'n', 'x', 'o' }, ']F', function()
	text_objects_move.goto_next_end('@function.outer', 'textobjects')
end, { desc = 'Next function end' })
keymap.set({ 'n', 'x', 'o' }, '[F', function()
	text_objects_move.goto_previous_end('@function.outer', 'textobjects')
end, { desc = 'Previous function end' })
keymap.set({ 'n', 'x', 'o' }, ']c', function()
	text_objects_move.goto_next_start('@class.outer', 'textobjects')
end, { desc = 'Next class start' })
keymap.set({ 'n', 'x', 'o' }, '[c', function()
	text_objects_move.goto_previous_start('@class.outer', 'textobjects')
end, { desc = 'Previous class start' })
keymap.set({ 'n', 'x', 'o' }, ']C', function()
	text_objects_move.goto_next_end('@class.outer', 'textobjects')
end, { desc = 'Next class end' })
keymap.set({ 'n', 'x', 'o' }, '[C', function()
	text_objects_move.goto_previous_end('@class.outer', 'textobjects')
end, { desc = 'Previous class end' })
