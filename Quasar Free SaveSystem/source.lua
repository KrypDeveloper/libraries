--TEST PHASE
local Module = {}

local ErrorCodes = {
    ErrorCode1 = "Instance Not Found Error Code: 1"
}

local hubname = nil

function Module:Boot(HubName)
    hubname = HubName
    writefile(hubname .. " Save Data Place:" .. game.PlaceId, game:GetService("HttpService"):JSONEncode({}))
    return hubname
end

function Module:SaveInstance(Instance, New)
    local data = game:GetService("HttpService"):JSONDecode(readfile(hubname .. " Save Data Place:" .. game.PlaceId))
    data[Instance] = New
    writefile(hubname .. " Save Data Place:" .. game.PlaceId, game:GetService("HttpService"):JSONEncode(data))
end

function Module:ReadInstance(Instance)
    local Http = game:GetService("HttpService")
    local data = Http:JSONDecode(readfile(hubname .. " Save Data Place:" .. game.PlaceId))
    if data[Instance] then
        return data[Instance]
    else
        error(ErrorCodes.ErrorCode1)
        return nil, ErrorCodes.ErrorCode1
    end
end

return Module
