-- example getting chain by name "$chat", printing genesis.
fc = require"freechains".new{ip="127.0.0.1", port="8330"} -- connect to daemon on 127.0.0.1:8330
ChatChain = require"chain".new(fc, "#test") -- load chain api, get chain "#test" with daemon above
print(ChatChain.name, ChatChain:genesis()) -- name, genesis -> $chat [gibberish]