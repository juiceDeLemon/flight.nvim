local M = {}

M.variants = { "f", "F", "t", "T", ";", "," }

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
