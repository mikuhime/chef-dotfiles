package 'fish' do
end

directory "/Users/#{node['dotfiles']['user']}/.config/fish" do
  owner node['dotfiles']['user']
  mode '0700'
end

cookbook_file "/Users/#{node['dotfiles']['user']}/.config/fish/config.fish" do
  source 'config.fish'
  mode '0700'
  owner node['dotfiles']['user']
end

cookbook_file '/etc/shells' do
  source 'etc_shells'
  user 'root'
  group 'wheel'
  mode '644'
end

user node['dotfiles']['user'] do
  action :modify
  shell '/usr/local/bin/fish'
end
