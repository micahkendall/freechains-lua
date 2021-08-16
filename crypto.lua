local crypto = {}
crypto.__index = crypto

function crypto.new(freechains)
    local crypto_instance = {freechains=freechains};
    setmetatable(crypto_instance, crypto)
    return crypto_instance
end

function crypto:genShared(passphrase)
    return (self.freechains:call{"crypto", "shared", passphrase})
end

function crypto:genPubPvt(passphrase)
    return (self.freechains:call{"crypto", "pubpvt", passphrase})
end

return crypto