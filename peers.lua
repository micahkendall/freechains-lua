--[[
'Peers' api is used for pinging peers and getting their chains
Functions here generate commands with the prefix "freechains peer"
]]

local peer = {}
peer.__index = peer

-- formats an address for commands to use
function peer.formatAddress(address, port)
    return "\'"..address..":"..port.."\'"
end

-- get a peers object for running commands to peers.
function peer.new(freechains) -- arg fc is a template from freechains{ip=...,port=...}
    local peer_instance = {freechains = freechains};
    setmetatable(peer_instance, peer)
    return peer_instance
end

-- runs and returns chains command for peer at address:port
function peer:chains(address, port)
    return (self.freechains:call{"peer", self.formatAddress(address, port), "chains"})
end

-- runs and returns ping command for peer at address:port
function peer:ping(address, port)
    return (self.freechains:call{"peer", self.formatAddress(address, port), "ping"})
end

return peer