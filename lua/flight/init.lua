--[[
NOTE: flow of execution
 0. create test mappings
 1. find the characters
 2. highlight the characters
 3. change the characters to numbers
 4. wait for user to enter the numebr
 5. move the cursor to the position
]]

local M = {}

M.default_config = {
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
}

M.config = {}

function M.load_options(u_options)
    M.config = vim.tbl_deep_extend("force", {}, M.default_config, u_options or {})
end

function M.load_mappings()
    local config = M.config
    M.map("n", config.mappings.f, "<cmd>lua print 'juiceDeLemon'<cr>", { desc = "Foward" })
end

function M.map(mode, key, rhs, opts)
    if key == "" then
        return
    end

    opts = vim.tbl_deep_extend("force", { noremap = true }, opts or {})
    if vim.fn.has "nvim-0.7" == 0 then
        opts.desc = nil
    end

    vim.api.nvim_set_keymap(mode, key, rhs, opts)
end

function M.setup(u_options)
    -- load options
    M.load_options(u_options)

    -- create highlight groups
    vim.api.nvim_set_hl(0, "FlightUnnumberedTargets", { fg = "red", underline = true })
    vim.api.nvim_set_hl(0, "FlightNumberedTargets", { underline = true })

    -- load keymaps
    M.load_mappings()
end

return M
