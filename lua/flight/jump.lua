local M = {}
local utils = require "flight.utils"

--[[ function M.find_target(variant)
    -- filter non-variant
    if not utils.is_variant(variant) then
        return -1
    end

   --  flow:
   --  1. search every area in 5 line radius
   --  2. scan the letters
   --  3. compare the list
   --  target is pattern
   -- 
end ]]

---@param backwards_continue boolean
-- if false then it is ";" if true it is ","
---@return nil
function M.continue(backwards_continue)
    local last_mode = utils.state.last_mode
    if backwards_continue then
        last_mode = utils.swap_direction(last_mode)
    end

    -- I really want to use loadstring() here but I'm too scared
    if last_mode == "f" then
        M.f(true)
    elseif last_mode == "F" then
        M.F(true)
    elseif last_mode == "t" then
        M.t(true)
    elseif last_mode == "T" then
        M.T(true)
    elseif last_mode == "" then
        return
    end
end

---@return nil
function M.f(is_continue)
    -- local ignore_case = config.result.ignore_case
    -- local target = vim.fn.searchpos(target, "nW")

    -- get target character using searchpos
    local target
    if not is_continue then
        target = vim.fn.getcharstr()
        utils.state.last_target = target
    else
        utils.state.last_mode = "f"
        target = utils.state.last_target
    end

    -- jump
    vim.fn.searchpos(target, "W")
end

---@return nil
function M.F(is_continue)
    -- local ignore_case = config.result.ignore_case
    -- local target = vim.fn.searchpos(target, "nW")

    -- get target character using searchpos
    local target
    if not is_continue then
        target = vim.fn.getcharstr()
        utils.state.last_target = target
    else
        utils.state.last_mode = "F"
        target = utils.state.last_target
    end

    -- jump
    vim.fn.searchpos(target, "bW")
end

---@return nil
function M.t(is_continue)
    -- local ignore_case = config.result.ignore_case
    -- local target = vim.fn.searchpos(target, "nW")

    -- get target character using searchpos
    local target
    if not is_continue then
        target = vim.fn.getcharstr()
        utils.state.last_target = target
    else
        utils.state.last_mode = "t"
        target = utils.state.last_target
    end

    -- jump
    vim.fn.searchpos(target, "W")
    -- move back one
    local after_searchpos_mpos = vim.api.nvim_win_get_cursor(0)
    if after_searchpos_mpos[2] ~= 0 then
        after_searchpos_mpos[2] = after_searchpos_mpos[2] - 1
    end
    vim.api.nvim_win_set_cursor(0, after_searchpos_mpos)
end

---@return nil
function M.T(is_continue)
    -- local ignore_case = config.result.ignore_case
    -- local target = vim.fn.searchpos(target, "nW")

    -- get target character using searchpos
    local target
    if not is_continue then
        target = vim.fn.getcharstr()
        utils.state.last_target = target
    else
        utils.state.last_mode = "T"
        target = utils.state.last_target
    end

    -- jump
    vim.fn.searchpos(target, "bW")
    -- move back one
    local after_searchpos_mpos = vim.api.nvim_win_get_cursor(0)
    after_searchpos_mpos[2] = after_searchpos_mpos[2] + 1
    vim.api.nvim_win_set_cursor(0, after_searchpos_mpos)
end

return M
