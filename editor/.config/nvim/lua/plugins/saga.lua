local saga = require "lspsaga"

saga.init_lsp_saga { server_filetype_map = { ["jdt.ls"] = { "java" } } }
