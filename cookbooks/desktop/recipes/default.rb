# vagrant desktop main cookbook
# This cookbook includes and sets up a remote desktop server.
#
require_recipe "local-cache"
require_recipe "apt"
require_recipe "chromium-browser"
# require_recipe "firefox"
require_recipe "ifdown"
