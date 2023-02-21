local M = {}

M.state = {
    last_mode = "",
    last_target = "",
    is_highlighting = false,
}

function M.swap_direction(mode)
    if mode == "f" then
        return "F"
    elseif mode == "F" then
        return "f"
    elseif mode == "t" then
        return "T"
    elseif mode == "T" then
        return "t"
    end
    return ""
end

function M.is_in_array(value, array)
    for _, v in ipairs(array) do
        if value == v then
            return true
        end
    end
    return false
end

function M.is_key_of_table(key, table)
    for k, _ in pairs(table) do
        if key == k then
            return true
        end
    end
    return false
end

function M.is_value_of_table(value, table)
    for _, v in pairs(table) do
        if value == v then
            return true
        end
    end
    return false
end

return M
