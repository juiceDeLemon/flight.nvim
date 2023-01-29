local M = {}

M.default = {
    mappings = {
        f = "f",
        F = "F",
        t = "t",
        T = "T",
        [";"] = ";",
        [","] = ",",
    },
    -- the key is the native bindings; the value is the new bindings of the new function
    -- if they are the same, it will override the native bindings
    -- you can keep the native bindings if you set the value to other keymaps
    -- empty string "" will disable the binding
    highlighted = 15, -- resuts to be highlighted
    numbered = 9, -- results to be numbered (max 9 for now)
    clear_highlight = 10000, -- remove the number and highlight after how many ms
}

M.result = {}

function M.load_config(u_options)
    M.result = vim.tbl_deep_extend("force", {}, M.default, u_options or {})
end

return M
