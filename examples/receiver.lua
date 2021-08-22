local fc = require"freechains".new{ip="127.0.0.1", port="8330"}
local Chains = require"Chains".new(fc)


print("Enter chain name: ")
local chain_name = io.read("*l")

Chains:listen(function(incoming)
    print(incoming)
end, chain_name)