#!/bin/bash
export PATH=/opt/puppetlabs/bin:$PATH
apt-get purge -y "puppet*"
wget https://apt.puppetlabs.com/puppet7-release-$(lsb_release -cs).deb
dpkg -i puppet7-release-$(lsb_release -cs).deb
apt-get update
apt-get -y install --no-install-recommends puppet-agent
ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet