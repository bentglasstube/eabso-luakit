---------------------------------------------
-- Share links with #eatabrick             --
-- © 2013 Alan Berndt <alan@eatabrick.org> --
---------------------------------------------

local io = io
local lousy = require "lousy"
local http = require "socket.http"
local add_cmds = add_cmds
local name = "bentglasstube"
local string = string

module("eabso")

local function url_encode(str)
  if (str) then
    str = string.gsub(str, "\n", "\r\n")
    str = string.gsub(str, "([^%w ])", function (c) return string.format("%%%02X", string.byte(c)) end)
    str = string.gsub(str, " ", "+")
  end
  return str
end

function share_link(w)
  local uri = url_encode(w.view.uri)

  b, c, h = http.request("http://eab.so/", "uri=" .. uri .. "&user=" .. name)

  if (b and string.match(b, "result")) then
    w:notify(string.match(b, "\"result\":\"(.*)\""))
  elseif (b and string.match(b, "error")) then
    w:notify(string.match(b, "\"error\":\"(.*)\""))
  else
    w:notify("bad response from eab.so")
  end
end

local cmd = lousy.bind.cmd
add_cmds({
  cmd("share", "Share link with #eatabrick", function (w) share_link(w) end),
})

