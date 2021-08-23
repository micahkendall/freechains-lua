-- example getting chains from peer 
fc = require"freechains".new{ip="127.0.0.1", port="8330"} -- connect to daemon on 127.0.0.1:8330
Peers = require"peers".new(fc) -- load peers api using daemon above
Chains = require"chains".new(fc) -- load chains api using daemon above

foreign_chains_string = (Peers:chains("francisco-santanna.duckdns.org", nil))
my_chains_list = Chains:list()

function joined_chain(v)
	for o,p in pairs(my_chains_list) do
		if p.name == v then
			return true
		end
	end
	return false
end
-- This will sync all commonly named chains
for match in (foreign_chains_string.." "):gmatch("(.-) ") do
	if joined_chain(match) then
		print("Synchronising "..match)
		Peers:receive("francisco-santanna.duckdns.org", nil, match)
		Peers:send("francisco-santanna.duckdns.org", nil, match)
	end
end

for i,v in pairs(Chains:list()) do -- loop through all chains
	print(i, v.name, v:genesis()) -- print index, name, genesis
end