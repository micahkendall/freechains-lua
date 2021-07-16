
# Lua API for the Freechains daemon.

Freechains is a peer-to-peer publish-subscribe content dissemination protocol. The purpose of this project is to allow developers to easily make use of the protocol in their projects. It may also be used for creating tests to run against the build (Security against sybil attacks, etc)

#### Part of LabLua GSoC'2021

### Requirements

	- lua
	- lua sockets
	- freechains daemon

### Basics

Freechains.lua is simple

- `freechains = require("freechains")` will load in the api

	- `freechains{...args, ```js string``` ip=..., ```js string``` port=...}` can be used for basic string commands
	- `fc = freechains{ip=..., port=...}`Without passing any arguments, the daemon "templates", giving a function which can be used to run commands with common ip+port
		- `chains_list = fc{"chains", "list"}` 

Other modules are included as an extension of this api. These are peers.lua, chains.lua, chain.lua, crypto.lua. Each of these require freechains, and the use of the templating. Objects for using these apis are instantiated by passing the templates.

##### Peers (peers.lua)
- `peers = require('peers.lua')(fc)`
	- `peers:chains(address, port)` Gets the available chains from a given peer.
	- `peers:ping(address, port)` Counts the round-trip time to a given peer.
##### Chains (chains.lua)
- `chains = require('chains.lua')(fc)`
	- `chains:join(chain_name, key)` Prepares host to serve a chain.
	- `chains:leave(chain_name, key)` Leaves a chain removing all of its data.
	- `chains:strList(chain_name, key)` Lists all local chains (as a string).
	- `chains:list(chain_name, key)` Lists all local chains (as a table).
##### Chain (chain.lua)
- `chain = require('chain.lua')(fc, chain_name)`
	- `chain:genesis()` Gets the genesis block for the chain.
	- `chain:heads()` Gets the hash of the heads in the chains.
	- `chain:get()` Gets the block with the given hash.
	- `chain:post()` Posts a new block in the chain.
	- `chain:like()` Likes a block in the chain.
	- `chain:dislike()` Dislikes a block in the chain.
	- `chain:reps()` Gets the reputation of post (block hash) or author (public key).
	- `chain:traverse()` Traverses and gets the hashes of a sub-tree of blocks in the chain. Starts from the heads and traverses down to the given block hashes (excluded).
##### Crypto (crypto.lua)
- `crypto = require('crypto.lua')(fc)`
	- `crypto:genShared()` Creates a symmetric key to encrypt posts.
	- `crypto:genPubPvt()` Creates a pair of public/private keys to sign and encrypt posts.