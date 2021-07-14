-- example getting chains from peer 
fc = require"freechains"{ip="127.0.0.1", port="8330"} -- connect to daemon on 127.0.0.1:8330
Chains = require"chains".new(fc) -- load chains api using daemon above
for i,v in pairs(Chains:list()) do -- loop through all chains
	print(i, v.name, v:genesis()) -- print index, name, genesis
end