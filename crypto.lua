local freechains = require("fc.lua")

local crypto = {}
crypto.__index = crypto

-- new/newFromDaemon would not need to be different if instead a table was passed (:thinking_face:)
function crypto.new(ip, port)
	local newCrypto = {ip=ip; port=port};
	setmetatable(newCrypto, crypto)
	return newCrypto
end

function crypto.newFromDaemon(daemon)
	local newCrypto = {ip=daemon.ip; port=daemon.port};
	setmetatable(newCrypto, crypto)
	return newCrypto
end

function crypto.genShared(passphrase)
	return freechains{"crypto", "shared", passphrase, ip=self.ip; port=self.port}
end

function crypto.genPubPvt(passphrase)
	return freechains{"crypto", "pubpvt", passphrase, ip=self.ip; port=self.port}
end