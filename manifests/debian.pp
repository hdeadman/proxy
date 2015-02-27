#Class: proxy
class proxy::debian (
             $http_proxy_host = nil, 
             $http_proxy_port = nil, 
             $https_proxy_host = nil, 
             $https_proxy_port = nil, 
             $no_proxy_domains = nil,
    ) {
    file {
    "apt-cachelimit":
        ensure  => file,
        path    => '/etc/apt/apt.conf.d/11cache',
        mode    => "0644",
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/proxy/11cache",
        before  => File["apt-proxy"], 
    }

	file { '/etc/environment':
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/environment.erb'),
	}
	file {
	"apt-proxy":
		ensure	=> file,
		path 	=> '/etc/apt/apt.conf.d/40proxy',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/40proxy.erb'),
	}
}
