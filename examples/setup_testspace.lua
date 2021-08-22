local CONST_TEST_CHAIN_DEFAULT = "11374EF6DBE219A3E50712FD820013274B13E4BBF5BBC78101126CF21710C661"

local socket = require"socket"
local fc = require"freechains".new{ip="127.0.0.1", port="8330"}
local Chains = require"chains".new(fc)
local Peers = require"peers".new(fc)

-- Checks if a #test chain is joined, then joins.
do
    local found_test_chain = false
    for _, Chain in pairs(Chains:list()) do -- check if #test found in list
        if Chain.name=="#test" then
            found_test_chain = true
        end
    end
    if found_test_chain then
        print("A connected #test chain was found.")
    else
        Chains:join("#test", CONST_TEST_CHAIN_DEFAULT)
        print("A connected #test chain was not found, it has been joined with key "..CONST_TEST_CHAIN_DEFAULT)
    end
end

-- Periodically syncs with hosts francisco, lcc-uerj.
-- This will only keep the #test chain in sync!

-- The below snippet will work for manually controlling receiving posts, if you want to for some reason.
-- A better way using proper apis is in /examples/receiver.lua
while true do
    print(Peers:receive("francisco-santanna.duckdns.org", nil, "#test"))
    print(Peers:send("francisco-santanna.duckdns.org", nil, "#test"))
    socket.sleep(15)
end