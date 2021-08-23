local crypto = {}
crypto.__index = crypto

function crypto.new(freechains)
    local crypto_instance = {freechains=freechains};
    setmetatable(crypto_instance, crypto)
    return crypto_instance
end

function crypto:genShared(passphrase)
    return (self.freechains:call{"crypto shared\n"..passphrase})
end

function crypto:genPubPvt(passphrase)
    local t={}
    for match in (self.freechains:call{"crypto pubpvt\n"..passphrase}.." "):gmatch("(.-) ") do
        table.insert(t, match)
    end
    return t[1], t[2]
end

return crypto