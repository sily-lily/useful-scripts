--[[

    General workspace plugins and/or themes.. and stuff

                   October 11th, 2025

]]

local pacman = require("pacman")

pacman.use("https://github.com/nvim-tree/nvim-tree.lua", function()
    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive"
        },

        -- How the tree is displaying graphically
        view = {
            width = 30
        },
        renderer = {
            group_empty = true
        },

        -- Excluding files
        filters = {
            dotfiles = true
        }
    })
end)
