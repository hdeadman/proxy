
class proxy::redhat-remove {
	$files_to_remove = [ "/etc/profile.d/proxy.sh" ]
	file { $files_to_remove:
		ensure	=> absent,
	}
	file_line { 'yum_noproxy':
        path => '/etc/yum.conf',
        line => "proxy='_none_'",
        match => '^proxy=.*'
    }
}

