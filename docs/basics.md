[<- Setup](setup.md)

# Basic Usage of the Freechains.lua api

Freechains.lua is simple

- ```lua
    freechains = require("freechains")
    ```
    will load in the api

- ```lua
    freechains{strings ...args, string ip=..., string port=...} -- You usually won't actually use the api like this
    ```
    Calling basic string commands

- ```lua
    fc = freechains{string ip = ..., string port = ...} -- "templating" is the preferable way to use the api.
    chains_list = fc{"chains", "list"}
    ```
    Without passing any arguments, the daemon "templates", giving a function which can be used to run commands with common ip:port target

## Extensions

Other modules are included as an extension of this api. These are peers.lua, chains.lua, chain.lua, crypto.lua. Each of these require freechains, and the use of the templating. Objects for using these apis are instantiated by passing the "templates".

### Module Directory
#### Contains guide for requiring the module, explanation of functions.

- For communicating with other **peers**

[Peers module](peers.md)

- For joining, leaving, listing all **chains**.

[Chains module](chains.md)

- For operations to a particular **chain**.
    - i.e get payload, like, dislike, getReps

[Chain module](chain.md)

- For key generation using **crypto**
    - Pub

[Crypto module](crypto.md)