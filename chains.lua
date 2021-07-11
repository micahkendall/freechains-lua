local chain = require("chain")
local chains = {}
chains.__index = chains

function chains.new(fc)
    local newChains = {freechains = fc};
    setmetatable(newChains, chains)
    return newChains
end

function chains:join(chain, key)
    return self.freechains{"chains", "join", chain, key}
end

function chains:leave(chain, key)
    return self.freechains{"chains", "leave", chain}
end

function chains:strList()
    return self.freechains{"chains", "list"}
end

function chains:list()
    return self.freechains{"chains", "list"}
end

function chains:listen(handler)

end

return chains