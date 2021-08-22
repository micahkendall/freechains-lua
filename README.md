
# Lua API for the Freechains daemon.

Freechains is a peer-to-peer publish-subscribe content dissemination protocol. The purpose of this project is to allow developers to easily make use of the protocol in their projects. It may also be used for creating tests to run against the build (Security against sybil attacks, etc)

#### Part of LabLua GSoC'2021

# Setup of the Freechains.lua api.

Freechains.lua requires
- [freechains](https://github.com/Freechains/README)
- [lua](http://www.lua.org)
- [luasockets](https://github.com/diegonehab/luasocket)

To install & run examples:

```bash
	git pull https://github.com/micahkendall/freechains-lua.git
	```

Files [freechains.lua](../freechains.lua), [peers.lua](../peers.lua), [chains.lua](../chains.lua), [chain.lua](../chain.lua), [crypto.lua](../crypto.lua) should all be in the same folder as your source folder. 

See the basics [here](basics.md)