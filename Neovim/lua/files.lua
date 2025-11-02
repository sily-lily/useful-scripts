local pacman = require("toolkits.pacman")
local KeybindManager = require("toolkits.binder")

pacman.use("https://github.com/nvim-lua/plenary.nvim")

pacman.use("https://github.com/ibhagwan/fzf-lua", function()
    local fzf = require("fzf-lua")
    fzf.setup({
        winopts = {
            height = 0.85,
            width = 0.80,
            row = 0.30,
            col = 0.50,
        },
        
        fzf_opts = {
            ["--layout"] = "reverse",
            ["--info"] = "inline",
        },
    })

    KeybindManager.map("n", "Alt + F", function()
        fzf.files({
            cwd = vim.fn.expand("%:p:h")
        })
    end)
end, "fzf-lua", "https://api.github.com/repositories/384850341/contents/lua/fzf-lua")
