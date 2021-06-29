local freechains = require("fc.lua")

local peer = {}
peer.__index = peer

function peer.formatAddress(address, port)
	return "\'"..address..":"..port.."\'", "ping"
end

function peer.newDaemon(ip, port)
	-- add validation for ip/port here
	local daemon = {ip=ip, port=port};
	setmetatable(daemon, peer)
	
	return daemon
end

function peer:chains(address, port) -- convert this into a table
	return freechains{"peer", self.formatAddress(address, port), "chains", ip=self.ip; port=self.port}
end

function peer:ping(address, port)
	return freechains{"peer", self.formatAddress(address, port), "ping", ip=self.ip; port=self.port}
end
