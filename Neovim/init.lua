-- General stuff

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Requiring ./lua files

local path = vim.fn.stdpath("config") .. "/lua"

local function require_files(directory, prefix)
    prefix = prefix or ""

    for _, file in ipairs(vim.fn.readdir(directory)) do
        local full_path = directory .. "/" .. file
        local stat = vim.loop.fs_stat(full_path)

        if stat then
            if stat.type == "file" and file:match("%.lua$") and (
                file ~= "pacman.lua"    and
                file ~= "binder.lua"    and
                file ~= "dashboard.lua"
            ) then
                require(prefix .. file:gsub("%.lua$", ""))
            elseif stat.type == "directory" then
                require_files(full_path, prefix .. file .. ".")
            end
        end
    end

    require("dashboard")
end

require_files(path)
