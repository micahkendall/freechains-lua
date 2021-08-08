[<- Basics](basics.md)
# Chains (chains.lua)

## Requiring 
	
- ```lua
	chains = require('chains.lua')(fc)
	```
	Module is loaded and ready
## Joining / Leaving
- ```lua
	chains:join(string chain_name, string key)
	```
	Prepares host to serve a chain.

- ```lua
	chains:leave(string chain_name, string key)
	```
	Leaves a chain removing all of its data.

## Retrieve chains as list

- ```lua
	chains:strList(string chain_name, string key)
	```
	Lists all local chains (as a string).

- ```lua
	chains:list(string chain_name, string key)
	```
	Lists all local chains (as a table).