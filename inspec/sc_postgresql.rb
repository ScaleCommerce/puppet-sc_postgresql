# postgresql running in supervisor?
describe command('supervisorctl status postgresql') do
  its('stdout') { should match 'RUNNING'}
end
