--[[
'Chain' api is used for manipulating a joined/downloaded-chain
Functions here generate commands with the prefix "freechains chain"
]]

local chain = {}
chain.__index = chain

-- get a chain object for a chain by name
function chain.new(freechains, name)
    local chain_instance = {name = name; freechains = freechains}
    setmetatable(chain_instance, chain)
    return chain_instance
end

-- runs and returns genesis command for chain object
function chain:genesis()
    return (self.freechains:call{"chain", self.name, "genesis"})
end

-- runs and returns heads command for chain object
function chain:heads(blocked)
    return (self.freechains:call{"chain", self.name, "heads", blocked and "[blocked]"})
end

-- chains below need capabilities added for signing somehow

-- runs and returns getBlock command for chain object
function chain:getBlock(hash)
    -- I'm not sure if the lua api needs to make use of the [file <path>]
    return (self.freechains:call{"chain", self.name, "get", "block", hash})
end

-- runs and returns getPayload command for chain object
function chain:getPayload(hash)
    return (self.freechains:call{"chain", self.name, "get", "payload", hash})
end

-- I think this should be made into a table for argument passthrough
-- or, the daemon could be initiated with a signing key? 
-- runs and returns post command for chain object
function chain:post(text)
    -- inline, text
    return (self.freechains:call{"chain", self.name, "post", "inline", text})
end

-- runs and returns like command for chain object
function chain:like(hash)
    return (self.freechains:call{"chain", self.name, "like", hash})
end

-- runs and returns dislike command for chain object
function chain:dislike(hash)
    return (self.freechains:call{"chain", self.name, "dislike", hash})
end

-- runs and returns getReps command for chain object
function chain:getReps(hash_or_pub)
    return (self.freechains:call{"chain", self.name, "reps", hash_or_pub})
end

-- runs and returns traverse command for chain object
function chain:traverse(hashes)
    local hashes_str = ""
    for i,v in ipairs(hashes) do
        hashes_str = hashes_str .. "\'" .. v .."\' "
    end
    return (self.freechains:call{"chain", self.name, "traverse", table.concat(hashes, " ")})
end

function chain:listen()
    return (self.freechains:call{"chain", self.name, "listen"})
end

return chain