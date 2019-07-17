class sc_postgresql::supervisor(
){

  include supervisord
  include postgresql::server

  file { ['/etc/init/postgresql.conf', '/etc/init.d/postgresql']:
    ensure => absent,
    require => Package['postgresql-server'],
  }

  supervisord::program { 'postgresql':
    command     => "/usr/lib/postgresql/${postgresql::globals::version}/bin/postgres -D /var/lib/postgresql/${postgresql::globals::version}/main -c config_file=/etc/postgresql/${postgresql::globals::version}/main/postgresql.conf",
    autostart   => true,
    autorestart => true,
    user        => postgres,
    require     => Package['postgresql-server'],
    before      => Service['postgresqld'],
  }

  Service <| title == "postgresqld" |> {
    provider => supervisor,
  }
}