--[[
'Chains' api is used for manipulating what chains are connected/joined to,
Functions here generate commands with the prefix "freechains chains"
]]

local chain = require("chain")
local chains = {}
chains.__index = chains

-- create a chains object for a particular daemon which allows 
function chains.new(freechains)
    local chains_instance = {freechains = freechains};
    setmetatable(chains_instance, chains)
    return chains_instance
end

-- runs and returns join command for chains object
function chains:join(chain_name, key)
    return (self.freechains:call{"chains", "join", chain_name, key})
end

-- runs and returns leave command for chains object
function chains:leave(chain_name)
    return (self.freechains:call{"chains", "leave", chain_name})
end

-- runs and returns list command for chains object
function chains:strList()
    return self.freechains:call{"chains", "list"}
end

-- runs and returns list command for chains object, but processes it into a table list
function chains:list()
    local list = {}
    for match in (self:strList().." "):gmatch("(.-) ") do
        table.insert(list, chain.new(self.freechains, match))
    end
    return list
end

function chains:listen(listener, chain)
    self.freechains:listen({"chains", "listen"}, listener)
end

return chains