--[[
'Chain' api is used for manipulating a joined/downloaded-chain
Functions here generate commands with the prefix "freechains chain"
]]

local chain = {}
chain.__index = chain

function chain.new(fc, name)
    local newChain = {name = name; freechains = fc}
    setmetatable(newChain, chain)
    return newChain
end

function chain:genesis()
    return self.freechains{"chain", self.name, "genesis"}
end

function chain:heads(blocked)
    return self.freechains{"chain", self.name, "heads", blocked and "[blocked]"}
end

-- chains below need capabilities added for signing somehow

function chain:getBlock(hash)
    -- I'm not sure if the lua api needs to make use of the [file <path>]
    return self.freechains{"chain", self.name, "get", "block", hash}
end

function chain:getPayload(hash)
    return self.freechains{"chain", self.name, "get", "payload", hash}
end

-- I think this should be made into a table for argument passthrough
-- or, the daemon could be initiated with a signing key? 
function chain:post(text)
    -- inline, text
    return self.freechains{"chain", self.name, "post", "inline", text}
end

function chain:like(hash)
    return self.freechains{"chain", self.name, "like", hash}
end

function chain:dislike(hash)
    return self.freechains{"chain", self.name, "dislike", hash}
end

function chain:getReps(hash_or_pub)
    return self.freechains{"chain", self.name, "reps", hash_or_pub}
end

function chain:traverse(hashes)
    local hashes_str = ""
    for i,v in ipairs(hashes) do
        hashes_str = hashes_str .. "\'" .. v .."\' "
    end
    return self.freechains{"chain", self.name, "traverse", table.concat(hashes, " ")}
end

function chain:listen()
    return self.freechains{"chain", self.name, "listen"}
end