local peer = {}
peer.__index = peer

function peer.formatAddress(address, port)
    return "\'"..address..":"..port.."\'"
end

function peer.newDaemon(fc) -- arg fc is a template from freechains{ip=...,port=...}
    local daemon = {freechains = fc};
    setmetatable(daemon, peer)
    return daemon
end

function peer:chains(address, port)
    return self.freechains{"peer", self.formatAddress(address, port), "chains"}
end

function peer:ping(address, port)
    return self.freechains{"peer", self.formatAddress(address, port), "ping"}
end
