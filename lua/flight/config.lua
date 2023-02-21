local M = {}

M.default = {
    mappings = {
        f = "<leader><leader>f",
        F = "<leader><leader>F",
        t = "<leader><leader>t",
        T = "<leader><leader>T",
        continue = "<leader><leader>;", -- aka ";"
        continue_reverse = "<leader><leader>,", -- aka ","
    },
    -- the key is the native bindings (can't get [";"] or [","] to work); the value is the new bindings of the new function
    -- you can keep the native bindings if you set the value to other keymaps
    -- empty string "" will disable the binding
    highlighted = 15, -- resuts to be highlighted
    numbered = 9, -- results to be numbered (max 9 for now)
    multiline = 3, -- how many lines do multiline consider, up and down each (not combined). set to 0 to disable multiline
    clear_highlight = 2000, -- remove the number and highlight after how many ms
    ignore_case = false, -- ignore case
}

M.result = {}

function M.load_config(u_options)
    M.result = vim.tbl_deep_extend("force", {}, M.default, u_options or {})
end

return M
