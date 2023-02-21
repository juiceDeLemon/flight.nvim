--[[
    NOTE:
    flow of execution
     0. create config, highlights, mappings
     1. find the characters
     2. highlight the characters
     3. change the characters to numbers
     4. wait for user to enter the numebr
     5. move the cursor to the position
    plugin behaviour:
     1. {f/F/t/T}{char} -> got to {default char} pos
     2. display numbers (2 to 9) (few secs)
     3. if {}{char}{num} then repeate from 2.
     4. :checkhealth to check conflict of highlight group name at least 0.7
]]

local M = {}

local config = require "flight.config"

--------------
-- MAPPINGS --
--------------
function M.load_mappings()
    -- stylua: ignore start
    M.map(config.default.mappings.f, "<cmd>lua require'flight.jump'.f(false)<cr>", "Foward")
    M.map(config.default.mappings.F, "<cmd>lua require'flight.jump'.F(false)<cr>", "Backward")
    M.map(config.default.mappings.t, "<cmd>lua require'flight.jump'.t(false)<cr>", "Fowards Until")
    M.map(config.default.mappings.T, "<cmd>lua require'flight.jump'.T(false)<cr>", "Backwards Until")
    M.map(config.default.mappings.continue, "<cmd>lua require'flight.jump'.continue(false)<cr>", "Continue")
    M.map(config.default.mappings.continue_reverse, "<cmd>lua require'flight.jump'.continue(true)<cr>", "Continue Reverse")
    -- stylua: ignore end
end

function M.map(key, rhs, opts)
    if key == "" then
        return
    end

    opts = vim.tbl_deep_extend("force", { noremap = true }, { desc = opts } or {})
    if vim.fn.has "nvim-0.7" == 0 then
        opts.desc = nil
    end

    vim.api.nvim_set_keymap("n", key, rhs, opts)
end

-----------
-- SETUP --
-----------
function M.setup(u_options)
    -- load options
    config.load_config(u_options)

    -- create highlight groups
    vim.api.nvim_set_hl(0, "FlightUnnumberedTargets", { fg = "red", underline = true })
    vim.api.nvim_set_hl(0, "FlightNumberedTargets", { underline = true })

    -- load keymaps
    M.load_mappings()
end

return M
