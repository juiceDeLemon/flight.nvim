local M = {}

M.namespace = vim.api.nvim_create_namespace "Flight"

---@class Options
local defaults = {
    --[[
    NOTE:
        if eg f = "f", then override f to new function.
        if eg f = "<leader>f", then only map <leader>f to own function
    ]]
    mappings = {
        f = "f",
        F = "F",
        t = "t",
        T = "T",
        [";"] = ";",
        [","] = ",",
    },
    -- the key is the native bindings; the value is the new bindings of the new functions
    -- if they are the same, it will override the native bindings
    -- you can keep the native bindings if you set the value to other keymaps
    highlighted = 15, -- results to be highlighted
    numbered = 9, -- results to be numbered (max 9)
}

---@type Options
M.options = {}

---@param options? Options
function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
