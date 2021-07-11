local crypto = {}
crypto.__index = crypto

-- new/newFromDaemon would not need to be different if instead a table was passed (:thinking_face:)
function crypto.new(fc)
    local newCrypto = {freechains=fc};
    setmetatable(newCrypto, crypto)
    return newCrypto
end

function crypto.genShared(passphrase)
    return self.freechains{"crypto", "shared", passphrase}
end

function crypto.genPubPvt(passphrase)
    return self.freechains{"crypto", "pubpvt", passphrase}
end