package 'fish' do
end

directory '/Users/miku/.config/fish' do
  owner 'miku'
  mode '0700'
end

cookbook_file '/Users/miku/.config/fish/config.fish' do
  source 'config.fish'
  mode '0700'
  owner 'miku'
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
