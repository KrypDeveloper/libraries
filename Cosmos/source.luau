local function a(className)
    return Instance.new(className)
end

Cosmos = {}

function Cosmos:Make(template)
    return function()
        local className = template.ClassName
        if not className then
            error("Template missing 'ClassName' field")
        end
        local instance = a(className)
        for attribute, value in pairs(template) do
            if attribute ~= "ClassName" then
                instance[attribute] = value
            end
        end
        return instance
    end
end

return Cosmos
