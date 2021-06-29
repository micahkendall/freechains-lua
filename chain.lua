local freechains = require("fc.lua")
--[[
'Chain' api is used for manipulating a joined/downloaded-chain
Functions here generate commands with the prefix "freechains chain"
]]

local chain = {}
chain.__index = chain

function chain.new(name, ip, port)
	local newChain = {name = name; ip=ip; port=port}
	setmetatable(newChain, chain)
	return newChain
end

function chain.newFromDaemon(name, daemon)
	local newChain = {name = name; ip=daemon.ip; port=daemon.port}
	setmetatable(newChain, chain)
	return newChain
end

function chain:genesis()
	return freechains{"chain", self.name, "genesis", ip=self.ip; port=self.port}
end

function chain:heads(blocked)
	return freechains{"chain", self.name, "heads", blocked and "[blocked]", ip=self.ip; port=self.port}
end

-- chains below need capabilities added for signing somehow

function chain:getBlock(hash)
	-- I'm not sure if the lua api needs to make use of the [file <path>]
	return freechains{"chain", self.name, "get", "block", hash, ip=self.ip; port=self.port}
end

function chain:getPayload()
	return freechains{"chain", self.name, "get", "payload", hash, ip=self.ip; port=self.port}
end

-- I think this should be made into a table for argument passthrough
-- or, the daemon could be initiated with a signing key? 
function chain:post(text)
	-- inline, text
	return freechains{"chain", self.name, "post", "inline", text, ip=self.ip; port=self.port}
end

function chain:like(hash)
	return freechains{"chain", self.name, "like", hash, ip=self.ip; port=self.port}
end

function chain:dislike(hash)
	return freechains{"chain", self.name, "dislike", hash, ip=self.ip; port=self.port}
end

function chain:getReps(hash_or_pub)
	return freechains{"chain", self.name, "reps", hash_or_pub, ip=self.ip; port=self.port}
end

function chain:traverse(hashes)
	local hashes_str = ""
	for i,v in ipairs(hashes) do
		hashes_str = hashes_str .. "\'" .. v .."\' "
	end
	return freechains{"chain", self.name, "traverse", table.concat(hashes, " "), ip=self.ip; port=self.port}
end

function chain:listen()
	return freechains{"chain", self.name, "listen"}
end