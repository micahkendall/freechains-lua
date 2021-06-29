--[[
questions: 
would it be okay to make the apis pass tables instead of tuples to make the api more concise with passing the "template" for an ip/port



todo:
template for the freechains which is instantiated with an ip/port, this is then what is passed to all the other apis meaning you don't need to call each api with an ip and port

explanations:
currently every api has to be instantiated with a ip/port, I would rather instead have the port/ip instantiated once through the main freechains api and then have 

api concatenation:
freechains{ip=..., port=...}{'chains get'}
]]