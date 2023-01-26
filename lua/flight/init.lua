--[[
NOTE: flow of execution
 0. create the mappings
 1. find the characters
 2. highlight the characters
 3. change the characters to numbers
 4. wait for user to enter the numebr
 5. move the cursor to the position
]]

local M = {}

---@param options? Options
function M.setup(options)
    local config = require "flight.config"
    config.setup(options)

    -- create highlight group
    vim.api.nvim_set_hl(0, "FlightTargets", { underline = true })
    -- create mappings
end

return M
