class sc_nginx::supervisor(
){

  include supervisord
  include postgresql::server
  include postgresql::repo

  file { ['/etc/init/postgresql.conf', '/etc/init.d/postgresql']:
    ensure => absent,
    require => Package['postgresql-server'],
  }

  supervisord::program { 'postgresql':
    command     => "/usr/lib/postgresql/$postgresql::repo::version/bin/postgres -D /var/lib/postgresql/$postgresql::repo::version/main -c config_file=/etc/postgresql/$postgresql::repo::version/main/postgresql.conf",
    autostart   => true,
    autorestart => true,
    require     => Package['postgresql-server'],
    before      => Service['postgresqld'],
  }

  # override default service provider
  Service <| title == "postgresqld"|> {
    provider => supervisor,
  }
}
