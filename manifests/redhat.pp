
class proxy::redhat ($http_proxy_host = nil, 
             $http_proxy_port = nil, 
             $https_proxy_host = nil, 
             $https_proxy_port = nil, 
             $no_proxy_domains = nil,
    ) {
	file { "/etc/profile.d/proxy.sh":
		ensure	=> file,
		mode   	=> "0755",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/proxy.sh.erb'),
	}

    file_line { 'yum_proxy':
        path => '/etc/yum.conf',
        line => "proxy=http://${proxy::http_proxy_host}:${proxy::http_proxy_port}",
        match => '^proxy=.*'
    }
	
	file { '/etc/environment':
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/environment.erb'),
	}

}

