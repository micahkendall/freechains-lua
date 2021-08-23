[<- Read me](../README.md)

# Basic Usage of the Freechains.lua api

Freechains.lua is simple

- ```lua
    freechains = require("freechains")
    ```
    will load in the api

- ```lua
    freechains.new{ip="127.0.0.1", port="8330", callback=function(...) print(...) end} -- Prepares an instance object of freechains with ip+port for use with :call
    ```
    Prepare freechains configuration (ip+port)
    Returns a lua metatable which acts as an object.

- ```lua
    fc = freechains.new {ip="127.0.0.1", string port = ...} -- "templating" is the recommended way to use the api.
    chains_list = fc:call{"chains", "list"}
    ```
    Using the .new function, the daemon "templates", giving a object which can be used to run commands with common ip:port target

## Extensions

Other modules are included as an extension of this api. These are peers.lua, chains.lua, chain.lua, crypto.lua. Each of these require freechains, and the use of the templating. Objects for using these apis are instantiated by passing the "templates".

### Module Directory
#### Contains guide for requiring the module, explanation of functions.

## peers.lua

- For communicating with other **peers**

[Peers module docs](peers.md)

## chains.lua

- For joining, leaving, listing all **chains**.

[Chains module docs](chains.md)

## chain.lua

- For operations to a particular **chain**.
    - i.e get payload, like, dislike, getReps

[Chain module docs](chain.md)

## crypto.lua

- For key generation using **crypto**
    - Public keys,

[Crypto module docs](crypto.md)