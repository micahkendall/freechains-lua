-- example generating keys with code "mellon"
fc = require"freechains".new{ip="127.0.0.1", port="8330"} -- connect to daemon on 127.0.0.1:8330
Crypto = require"crypto".new(fc) -- load crypto api using daemon above
-- generate Public/Private
local public, private = Crypto:genPubPvt("mellon")
print("public: "..public)
print("private: "..private)
-- generate Shared
local shared = Crypto:genShared("mellon")
print("shared: "..shared)

-- this example fails for some reason, I believe it is an issue with the kotlin build!