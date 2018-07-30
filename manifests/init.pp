# == Class: sc_postgresql
#
# ScaleCommerce Wrapper Module for puppetlabs-postgresql.
# Manages Supervisord.
#
# === Variables
#
# [*use_supervisor*]
#   can be true or false, default is true.
#   determines if start script should be used with supervisor
#
# === Authors
#
# Thomas Lohner <tl@scale.sc>
#
# === Copyright
#
# Copyright 2018 ScaleCommerce GmbH.
#

class sc_postgresql (
  $use_supervisor = true,
) {

  if $use_supervisor {
    class {'::sc_postgresql::supervisor':}
  }

  # make sure package is installed from repo
  Class['apt::update'] -> Package['postgresql-server']

  include postgresql::server
  include postgresql::repo
  include sc_bashprofile

  file{'/root/.pgpass':
    content => "*:*:*:postgres:${postgresql::server::postgres_password}",
    mode    => "0600",
  }

  ensure_resources('postgresql::server::db', hiera_hash('sc_postgresql::databases', {}), hiera_hash('sc_postgresql::databases_defaults', {}))

#    postgresql::server::role

#    postgresql::server::database_grant


#    postgresql::server::table_grant


}
