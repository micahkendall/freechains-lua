[<- Basics](basics.md)
# Chain (chain.lua)

## Requiring 
- ```lua
	chain = require('chain.lua')(fc, string chain_name)
	```
	Module is loaded and ready

## Genesis block (first block)
- ```lua
	chain:genesis()
	```
	Gets the genesis block for the chain.

## Heads blocks (most recent blocks)
- ```lua
	chain:heads(bool blocked)
	```
	Gets the hash of the heads in the chains.

## Fetch info for a particular block (by hash)
- ```lua
	chain:getBlock(string hash)
	```
	Gets information about the block with the given hash.

## Fetch payload for a particular block (by hash)
- ```lua
	chain:getPayload(string hash)
	```
	Gets the payload for the block with the given hash.

## Append a post to the end of a chain
- ```lua
	chain:post(string text)
	```
	Posts a new block in the chain.

## Like a block in a chain (by hash)
- ```lua
	chain:like(string hash)
	```
	Likes a block in the chain.

## Dislike a block in a chain (by hash)
- ```lua
	chain:dislike(string hash)
	```
	Dislikes a block in the chain.

## Fetch reputation of a block in a chain (by hash)
- ```lua
	chain:getReps(string hash_or_pub)
	```
	Gets the reputation of post (block hash) or author (public key).

## Traverse a chain by hashes
- ```lua
	chain:traverse(table hashes)
	```
	Traverses and gets the hashes of a sub-tree of blocks in the chain. Starts from the heads and traverses down to the given block hashes (excluded).