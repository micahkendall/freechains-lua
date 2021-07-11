local fc = require"freechains"{ip="127.0.0.1", port="8330"}
local Chains = require"chains".new(fc)
print(Chains:list())