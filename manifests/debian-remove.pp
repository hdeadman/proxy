#Class: no-proxy
class proxy::debian-remove {


	$files_to_remove = [ "/etc/apt/apt.conf.d/40proxy"]
    file { $files_to_remove: 
		ensure	=> absent,
	}
	file { "/etc/environment":
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/proxy/noproxy-environment",
	}

}
