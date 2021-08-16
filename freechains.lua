local socket = require"socket"
local VERSION = "v0.8.6";

-- having one function for two uses was unclean and is better done using two functions
-- this will be done using a "freechains" object with .call and .new methods
-- the .call method will be static and the .new will create a new object
-- if you ever need to (for some reason) call a function only once with a unique ip+address, you can simply use freechains.new{...}:call("")

local freechains = {
    ip = "127.0.0.1",
    port = "8330",
    callback = print
}
freechains.__index = freechains

function freechains.new(args)
    local freechains_instance = {
        ip=args.ip,
        port=args.port,
        callback=args.callback
    }
    setmetatable(freechains_instance, freechains)
    return freechains_instance
end

-- if you are using some other interface than tcp (websocket, wrapping, etc...) this is the only function you should need to change
function freechains:call(args) -- tuple of strings
    assert(next(args)!=nil, "Freechains:call() must be passed arguments.")
    local command_string = args[1]
    table.remove(args, 1)
    for i, value in ipairs(args) do
        command_string = command_string .. ' ' .. value
        args[i] = nil
    end
    for param,value in pairs(args) do
        command_string = command_string .. ' -'..value
    end
    local daemon = socket.connect(self.ip, self.port)
    assert(daemon, "The daemon could not be found!")
    local daemon_string = string.format("FC %s %s\n", VERSION, command_string)
    daemon:send(daemon_string)
    local received = daemon:receive()
    if callback then
        callback(received)
    else
        return received
    end
end

-- made listen api seperate in order to concisely describe process
function freechains:listen(args)
    assert(next(args)!=nil, "Freechains:call() must be passed arguments.")
    assert(self.listener!=nil, "Freechains:listen() must be passed a listener callback function.")
    local command_string = args[1]
    table.remove(args, 1)
    for i, value in ipairs(args) do
        command_string = command_string .. ' ' .. value
        args[i] = nil
    end
    for param,value in pairs(args) do
        command_string = command_string .. ' -'..value
    end
    local daemon = socket.connect(self.ip, self.port)
    assert(daemon, "The daemon could not be found!")
    local daemon_string = string.format("FC %s %s\n", VERSION, command_string)
    daemon:send(daemon_string)
    while true do
        listener(daemon:receive())
    end
end

return freechains