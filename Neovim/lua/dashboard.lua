--[[

    ~ Dashboard configured using Alpha.nvim ~

              October 11th, 2025

]]

local pacman = require("pacman")

pacman.use("https://github.com/goolord/alpha-nvim", function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        "hello, world"
    }

    dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    require("alpha").setup(dashboard.opts)
end)
