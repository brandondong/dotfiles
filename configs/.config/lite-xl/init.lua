local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- See https://github.com/lite-xl/lite-xl/blob/master/data/core/config.lua.
config.transitions = false

-- See https://github.com/lite-xl/lite-xl/blob/master/data/plugins/linewrapping.lua.
config.plugins.linewrapping = {
  enable_by_default = true,
  mode = "word"
}
