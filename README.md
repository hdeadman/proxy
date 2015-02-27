Module Description
====================
Manage the Proxy configuration on Linux boxes where tinyproxy (only http/https) is the proxy you are using


Current OS Supported:
====================
  * Redhat based:
    * centos, fedora, redhat, scientific linux
  * Debian based:
    * debian, ubuntu

Usage:
====================
Setup the proxy:
----------------
**NOTE** Schemes are mandatory:
Proxy URLs now must have an explicit scheme. A MissingSchema exception will be raised if they don't. 
More info: https://pypi.python.org/pypi/requests

    node default {
        class { 'proxy': 
            http_proxy_host  =>  "http://myproxy.url.com", 
            http_proxy_port  => "3128", 
            https_proxy_host =>  "http://myproxy.url.com", 
            https_proxy_port => "3128", 
            no_proxy_domains => ".intel.com,.mylocalnet.com",
        }
    }

Remove the proxy:
----------------
    node default { 
        class { 'proxy::remove': } 
    } 


Example:
-------

    $ mkdir -p puppet/modules
    $ cd puppet/modules
    $ git clone https://github.com/patux/proxy.git
    $ cd proxy
    $ mv vendor/stdlib ../
    $ cd tests
    $ vi setup.pp # modify accoring your environment
    $ puppet apply --modulepath=../../ setup.pp


