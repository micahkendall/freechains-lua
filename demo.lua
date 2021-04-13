--[[
A question I have is, I'm not sure if it fits the style of normal lua to create classes like this?
It isn't a convention I've seen in any 'pure' lua libraries.

]]
local socket = require"socket"

local demo = {
    VERSION = "v0.7.10";
}
demo.__index = demo

function demo.new(ip, port)
    local self = setmetatable({}, demo)
    self.client = socket.connect(ip, port)
    return self
end

function demo:runAndWait(...)
    local outStr = "FC " .. self.VERSION .. " " .. (table.concat({...}, " ")) .. "\n"
    self.client:send(outStr)
    return self.client:receive()
end

function demo:run()
    local chains_list = self:runAndWait("chains", "list")
    assert(chains_list)
    print(chains_list)
    self.client:close()
end

demo.new('127.0.0.1','8330'):run()