[<- Basics](basics.md)
# Peers (peers.lua)

## Requiring 
- ```lua
	peers = require('peers.lua')(fc)
	```
	Module is loaded and ready

## Get list of chains
- ```lua
	peers:chains(string address, string port)
	```
	Gets the available chains from a given peer.

## Ping peer(s)
- ```lua
	peers:ping(string address, string port)
	```
	Counts the round-trip time to a given peer.

