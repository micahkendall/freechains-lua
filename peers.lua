--[[
'Peers' api is used for pinging peers and getting their chains
Functions here generate commands with the prefix "freechains peer"
]]
-- considering: breaking down into peers / peer so you only specify a peers ip once, and then you can run :chains :ping without respecifying

local peer = {}
peer.__index = peer

-- formats an address for commands to use
function peer.formatAddress(address, port)
    return "\'"..address..":"..port.."\'"
end

-- get a peers object for running commands to peers.
function peer.newDaemon(fc) -- arg fc is a template from freechains{ip=...,port=...}
    local daemon = {freechains = fc};
    setmetatable(daemon, peer)
    return daemon
end

-- runs and returns chains command for peer at address:port
function peer:chains(address, port)
    return (self.freechains{"peer", self.formatAddress(address, port), "chains"})
end

-- runs and returns ping command for peer at address:port
function peer:ping(address, port)
    return (self.freechains{"peer", self.formatAddress(address, port), "ping"})
end

return peer