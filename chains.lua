local freechains = require("fc.lua")
local chain = require("chain.lua")

local chains = {}
chains.__index = chains

function chains.new(name, ip, port)
	local newChain = {name = name; ip=ip; port=port};
	setmetatable(neChain, chain)
	return newChain
end

function chains