local socket = require"socket"
local VERSION = "v0.8.4";

-- freechains{tuples, arg1=val1; arg2=val2; etc etc} will execute a command
-- freechains{ip=ip; port=port} alone will return a "template" which can be passed to the other apis
function freechains(args)
    local ip, port = args.ip or '127.0.0.1', args.port or '8330'
    local listener = args.listener
    args.ip, args.port, args.listener = nil, nil, nil
    if next(args)==nil then -- in the case of no other arguments, templatify
        return template(ip, port)
    end
    local commandString = args[1]
    table.remove(args, 1)
    for i, value in ipairs(args) do
        commandString = commandString .. ' ' .. value
        args[i] = nil
    end
    for param,value in pairs(args) do
        commandString = commandString .. ' -'..value
    end
    local daemon = socket.connect(ip, port)
    local daemonString = string.format("FC %s %s\n", VERSION, commandString)
    daemon:send(daemonString)
    if listener then
        while true do
            table.insert(listener, daemon:receive())
        end
    else
        return daemon:receive()
    end
end

-- todo: metatableize this for oop style
function template(ip, port)
    return function(args)
        args.ip, args.port = ip, port
        return freechains(args)
    end
end

return freechains