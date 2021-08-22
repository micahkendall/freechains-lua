
# Lua API for the Freechains daemon.

Freechains is a peer-to-peer publish-subscribe content dissemination protocol. The purpose of this project is to allow developers to easily make use of the protocol in their projects. It may also be used for creating tests to run against the build (Security against sybil attacks, etc)

#### Part of LabLua GSoC'2021

# Setup of the Freechains.lua api.

Freechains.lua requires
- [freechains](https://github.com/Freechains/README)
- [lua](http://www.lua.org)
- [luasockets](https://github.com/diegonehab/luasocket)

All examples expect the freechains daemon (above) to be running!

To install & run examples:

Download & Change Directory
```bash
git pull https://github.com/micahkendall/freechains-lua.git
cd freechains-lua
```

Running setup_testspace will connect you to the #test channel and periodically fetch/refetch.
This should be left open in background if you haven't programmed another synchronisation loop.
```bash
lua ./examples/setup_testspace.lua
```

Running loop_sender connects to the #test channel with a REPL for chat/basic commands.
```bash
lua ./examples/loop_sender.lua
```

Other examples can be run similarly, swapping the file name.
```bash
lua ./examples/<file name>.lua
```

Files [freechains.lua](../freechains.lua), [peers.lua](../peers.lua), [chains.lua](../chains.lua), [chain.lua](../chain.lua), [crypto.lua](../crypto.lua) should all be in the same folder as your source folder. 

See the basics [here](docs/basics.md)