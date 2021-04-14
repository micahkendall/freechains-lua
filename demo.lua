local socket = require"socket" -- using LuaSocket library

local demo = {
    VERSION = "v0.7.10"; -- this should be hardcoded since each api will only be compatible with the major version for its code anyway
}
demo.__index = demo

-- basic metatable stuff for classes in lua
function demo.new(ip, port)
    local self = setmetatable({}, demo)
    self.client = socket.connect(ip, port)
    return self
end

-- allows for executing commands by running self:runAndWait(command, args ...)
-- yields until a response is received (hence the "AndWait")
function demo:runAndWait(...)
    local outStr = "FC " .. self.VERSION .. " " .. (table.concat({...}, " ")) .. "\n" -- kind of a dirty way of doing it, but good enough for a demo
    self.client:send(outStr)
    return self.client:receive()
end

-- uses demo api created above to run and print "chains list", the basic requirement of the demo
function demo:run()
    local chains_list = self:runAndWait("chains", "list") -- wait until response from running "chain list"
    assert(chains_list) -- assert a response (maybe should write an "assertWarn" function?) program shouldn't necessarily end if the socket fails
    print(chains_list)
    self.client:close() -- close socket. maybe should add functionality here to retry if the chains_list response fails?
end

-- create demo object, execute run method
demo.new('127.0.0.1','8330'):run()