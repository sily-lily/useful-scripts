--[[

    General workspace plugins and/or themes.. and stuff

                   October 11th, 2025

]]

local pacman = require("pacman")
local KeybindManager = require("binder")

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

    local function open_on_startup()
        local api = require("nvim-tree.api")
        local stats = vim.loop.fs_stat(vim.fn.getcwd())

        if stats and stats.type == "directory" then
            api.tree.open()
        end
    end

    vim.schedule(open_on_startup)
    KeybindManager.map("n", "Alt + G", function()
        require("nvim-tree.api").tree.toggle()
    end)
end)
