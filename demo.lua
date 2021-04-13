local socket = require"socket"

local client = socket.connect('127.0.0.1','8330')
client:send("FC v0.7.10 chains list\n")
local chains_list = client:receive()
print(chains_list)
client:close()