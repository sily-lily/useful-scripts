--[[

    Very basic Neovim package manager used in my configuration !!

                        October 11th, 2025

]]

local function get_plugin_name(repo)
    local cmd = string.format("curl -s https://api.github.com/repos/%s/contents/lua", repo)

    local result = vim.fn.system(cmd)
    local ok, data = pcall(vim.fn.json_decode, result)
    if not ok or type(data) ~= "table" then
        return "init"
    end

    for _, file in ipairs(data) do
        if file.name:match("%.lua$") then
            return file.name:gsub("%.lua$", "")
        end
    end
    
    return "init"
end

local function write_installer(url)
    local name = url:match(".*/(.-)%.git$") or url:match(".*/(.-)$")
    local install_path = vim.fn.stdpath("config") .. "/pack/plugins/start/" .. name

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.mkdir(vim.fn.stdpath("config") .. "/pack/plugins/start", "p")
        vim.fn.system({ "git", "clone", "--depth=1", url, install_path })
    end

    if vim.fn.isdirectory(install_path) == 1 then
        vim.cmd("packadd " .. name)
        vim.opt.rtp:prepend(install_path)
    else
        vim.notify("Failed to install plugin: " .. name, vim.log.levels.ERROR)
    end

    return name
end

local function use(url, callback)
    local repo = url:gsub("https://github.com/", "")
    local name = get_plugin_name(repo)
    
    write_installer(url)

    local ok, plugin = pcall(require, name)
    if ok then
        callback()
    end
end

return {
    use = use,
}
