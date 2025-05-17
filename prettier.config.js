import { config as prettierConfig } from '@kutsan/prettier-config'

const config = {
  ...prettierConfig,
  plugins: [...prettierConfig.plugins, 'prettier-plugin-toml'],
}

export default config
