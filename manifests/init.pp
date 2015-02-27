class proxy ($http_proxy_host = nil, 
             $http_proxy_port = nil, 
             $https_proxy_host = nil, 
             $https_proxy_port = nil, 
             $no_proxy_domains = nil ) {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      class { 'proxy::redhat': 
             http_proxy_host  => $http_proxy_host, 
             http_proxy_port  => $http_proxy_port, 
             https_proxy_host => $https_proxy_host, 
             https_proxy_port => $https_proxy_port, 
             no_proxy_domains => $no_proxy_domains,
       }
    }
    'debian', 'ubuntu': {
      class { 'proxy::debian':
             http_proxy_host  => $http_proxy_host, 
             http_proxy_port  => $http_proxy_port, 
             https_proxy_host => $https_proxy_host, 
             https_proxy_port => $https_proxy_port, 
             no_proxy_domains => $no_proxy_domains, 
      }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  } 
} 

