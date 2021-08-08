[<- Basics](basics.md)
# Crypto (crypto.lua)

## Requiring 
- ```lua
	crypto = require('crypto.lua')(fc)
	```
	Module is loaded and ready

## Generate Shared key
- ```lua
	crypto:genShared(string passphrase)
	```
	Creates a symmetric key to encrypt posts.

## Generate Public/Private key
- ```lua
	crypto:genPubPvt(string passphrase)
	```
	Creates a pair of public/private keys to sign and encrypt posts.