#!/bin/bash
export PATH=/opt/puppetlabs/bin:$PATH
sed -i -e "s/nodaemon=true/nodaemon=false/" /etc/supervisord.conf
/usr/local/bin/supervisord -c /etc/supervisord.conf
echo "Running in $(pwd)"
echo "Puppet Version: $(puppet -V)"

# configure puppet
ln -sf $(pwd)/test/hiera.yaml $(puppet config print confdir |cut -d: -f1)/
ln -sf $(pwd)/test/hieradata $(puppet config print confdir |cut -d: -f1)/hieradata
puppet config set certname puppet-test.scalecommerce

# install puppet modules
puppet module install puppetlabs-postgresql
puppet module install ajcrowe-supervisord --ignore-dependencies
git clone https://github.com/ScaleCommerce/puppet-supervisor_provider.git $(puppet config print modulepath |cut -d: -f1)/supervisor_provider
git clone https://github.com/ScaleCommerce/puppet-sc_bashprofile.git $(puppet config print modulepath |cut -d: -f1)/sc_bashprofile
ln -sf $(pwd) $(puppet config print modulepath |cut -d: -f1)/sc_postgresql

curl -s https://omnitruck.chef.io/install.sh | bash -s -- -P inspec -v 3.9.3
