--[[
TODO (Checklist):

Chains [
    Join <chain> [<key>...],
    Leave <chain>,
    List,
    Listen
]

Chain <name> [
    Genesis,
    Heads [blocked],
    Get (block | payload) <hash> [file <path>],
    Post (file | inline | -) [<path_or_text>],
    Like/Dislike <hash>,
    Reps <hash_or_pub>,
    Traverse <hashes>,
    Listen
]

Peer <add:Port> [
    Ping,
    Chains, 
    Send/Recv <chain>
]

Crypto [
    Shared/Pubpvt <passphrase>
]
]]

local socket = require"socket" -- using LuaSocket library

local fc = {
    VERSION = "v0.8.4"; -- this should be hardcoded since each api will only be compatible with the major version for its code anyway
}
fc.__index = fc

function fc.new(ip, port)
    local self = setmetatable({}, demo)
    self.client = socket.connect(ip, port)
    return self
end

function fc:runAndWait(...)
    local outStr = "FC " .. self.VERSION .. " " .. (table.concat({...}, " ")) .. "\n"
    self.client:send(outStr)
    return self.client:receive()
end

function fc:GetChain(name)
        -- Create a seperate chain class maybe? could imagine chain.lua, chains.lua, peer.lua, crypto.lua all being loaded for a main fc.lua. 
end

function fc:GetChains()
        local name_list = self:runAndWait("chains", "list")
        local chains_list = {}
        for chain_name in string.gmatch(chains_list, "[^%s]+") do
                table.insert(chains_list, self:GetChain(chain_name))
        end
        return chains_list
end

function fc.close()
        self.client:close()
end

return main