local opts = {
	toggle = {},
}

local function after_setup(snacks)
	snacks.toggle.option('spell', { name = 'Spelling' }):map('<Space>us')
end

return { opts = opts, after_setup = after_setup }
