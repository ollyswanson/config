local read_query = function(filename)
    return table.concat(vim.fn.readfile(vim.fn.expand(filename)))
end
require('nvim-treesitter.configs').setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = { "toml" },
        queries = {
           rust = read_query("~/.config/nvim/queries/rust/highlights.scm")
        }
    },
    indent = {
        enable = true,
        disable = { "toml" }
    },
    incremental_selection = {
        enable = true,
        disable = { "toml" }
    },
    textobjects = {
        enable = true,
        disable = { "toml" }
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            disable = { "toml" }
        },
        smart_rename = {
            enable = true,
            disable = { "toml" },
            keymaps = {
                smart_rename = "grr"
            }
        }
    }
})
