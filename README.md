Luakit eab.so Extension
=======================

An extension to let you share links with #eatabrick from Luakit.

Setup
-----

Copy the `eabso.lua` file to your luakit config directory (usually
`~/.config/luakit/`) and something like this to your rc.conf:

```lua
  local eabso = require "eabso"
  add_binds("normal", {
    key({}, "s", "Share link with #eatabrick",
      function (w) eabso.share_link(w) end),
  })
```

Configuration
-------------

In the `eabso.lua` file you can edit the name to use when posting links.

Usage
-----

You can use the command `:share` to share links but you should probably just
bind something to call `eabso.share_link(w)`

License
-------

See the LICENSE file for license details.
