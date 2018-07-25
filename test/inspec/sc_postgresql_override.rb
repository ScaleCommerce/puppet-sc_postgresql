# db my_new_db?
describe command('psql -h 127.0.0.1 -U postgres -t -c "SELECT datname FROM pg_database"') do
  its('stdout') { should match /[\n ]my_new_db[\n ]/}
end

# override user can connect to db?
describe command('PGPASSWORD="also_very_override_secret!!" psql -U my_override_user -h 127.0.0.1 my_db -c "\conninfo"') do
 its('exit_status') { should eq 0 }
end
