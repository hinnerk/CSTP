# Convenient Secure Tor Proxy (CSTP)

A multiple virtual machines based secure and convenient [tor][] proxy system. Utilising [vagrant][] and [chef][] and [VirtualBox][] to enable simple installation, configuration and destruction.

# Warning!

CSTP is neither completely implemented nor secure. It is in fact not even working yet. **Do not under any circumstances rely on this software for security or anonymity.**

Do not use it unless you are a masochist genius developer willing to risk everything in order to help us make this thing work properly. Note: You will not get paid (at least not by us).

# Setup

## Required prerequisites

* a supported operating system
    * Mac OS X (Snow Leopard) seems to work fine
    * Linux should work
    * Of course you may try for yourself! Please report to us as soon as you found out!
* [VirtualBox][] (current version)
* [Chef][]
* [Vagrant][]
* a X-Server, for example X11 (needs to be installed on Mac OS X, is usually dilivered with Linux)

## Startup

This should create two running virtual machines, connected via a private local interface. You should probably remove the external network connection (usually eth0) in the desktop vm manually to make sure the webbrowsers can only connect through TOR.

    $ vagrant box add lucid32_minbase http://files.randnotizen.de/lucid32_minbase.box
    $ git clone git@github.com:hinnerk/CSTP.git
    $ cd CSTP
    $ vagrant up
    $ vagrant chrome

After a few seconds a remote Googel Chrome should pop up on your local X-Server.


# We need help!

There's an awfull lot to do. Do you want to help? Drop a line and we'll shortly get in touch with you.


[chef]: http://www.opscode.com/chef/
[tor]: http://www.torproject.org/
[vagrant]: http://vagrantup.com/
[VirtualBox]: http://www.virtualbox.org/