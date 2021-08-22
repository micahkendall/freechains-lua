local fc = require"freechains".new{ip="127.0.0.1", port="8330"}
local Peers = require"peers".new(fc)
local Crypto = require"crypto".new(fc)

print("Enter chain name: ")
local chain_name = io.read("*l")
local Chain = require"Chain".new(fc, chain_name)

print("Enter secret password: ")
local secret_password = io.read("*l")
print(Crypto:genPubPvt(secret_password))

while true do
    print("To send: ")
    local chat_message = io.read("*l")
    if chat_message=="/send" then
        
    else
        Chain:post(chat_message)
    end
end