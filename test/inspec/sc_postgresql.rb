# postgresql running in supervisor?
describe command('supervisorctl status postgresql') do
  its('stdout') { should match 'RUNNING'}
end

# postgres accepting connections?
describe command('pg_isready -h 127.0.0.1') do
 its('exit_status') { should eq 0 }
end

# postgres connection working?
describe command('psql -h 127.0.0.1 -U postgres --no-password -c "\conninfo"') do
 its('exit_status') { should eq 0 }
end

# postgresql running in supervisor?
describe command('psql -h 127.0.0.1 -U postgres -t -c "SELECT datname FROM pg_database"') do
  its('stdout') { should match /[\n ]my_db[\n ]/}
end

# user can connect to db?
describe command('PGPASSWORD="also_very_secret!!" psql -U my_user -h 127.0.0.1 my_db -c "\conninfo"') do
 its('exit_status') { should eq 0 }
end
