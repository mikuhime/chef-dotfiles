package 'fish' do
end

cookbook_file '/etc/shells' do
  source 'etc_shells'
  user 'root'
  group 'wheel'
  mode '644'
end

user 'miku' do
  action :modify
  shell '/usr/local/bin/fish'
end
