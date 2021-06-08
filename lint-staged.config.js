module.exports = {
  '*.lua': ['luacheck', 'stylua'],
  '*.{js,json,md}': ['prettier --write']
}
