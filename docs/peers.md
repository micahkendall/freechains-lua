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

## Ping peer
- ```lua
	peers:ping(string address, string port)
	```
	Counts the round-trip time to a given peer.

## Send to peer
- ```lua
	peers:send(string address, string port, string chain)
	```
	Sends missing blocks to remote peer 

## Receive from peer
- ```lua
	peers:receive(string address, string port, string chain)
	```
	Receive missing blocks from remote peer