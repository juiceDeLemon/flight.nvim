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
    M.map("n", config.default.mappings.f, "<cmd>lua print 'juiceDeLemon'<cr>", { desc = "Foward" })
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
