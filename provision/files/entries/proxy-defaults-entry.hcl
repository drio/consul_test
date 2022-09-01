# The config entry kind is called proxy-defaults because it configures the defaults for all proxies.
Kind = "proxy-defaults"
# There can only be one proxy defaults config for the whole Consul installation, and its name must be global.
Name = "global"
Config {
  protocol = "http"
}
