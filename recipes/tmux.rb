#
# Cookbook Name:: dotfiles
# Recipe:: tmux
#

package 'tmux' do
end

directory "/Users/#{node['dotfiles']['user']}/.tmux" do
  mode '0700'
  owner node['dotfiles']['user']
end

directory "/Users/#{node['dotfiles']['user']}/.tmux/plugins" do
  mode '0700'
  owner node['dotfiles']['user']
  recursive true
end

git "/Users/#{node['dotfiles']['user']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node['dotfiles']['user']
end

execute 'reload_tmux' do
  action :nothing
  command 'tmux source /Users/miku/.tmux.conf'
  guard_interpreter :bash
  only_if 'tmux info &> /dev/null', user: node['dotfiles']['user']
  user node['dotfiles']['user']
end

execute 'install_plugins' do
  action :nothing
  command "/Users/#{node['dotfiles']['user']}/.tmux/plugins/tpm/bin/install_plugins"
  user node['dotfiles']['user']
end

cookbook_file "/Users/#{node['dotfiles']['user']}/.tmux.conf" do
  source 'tmux.conf'
  mode '0700'
  owner node['dotfiles']['user']
  notifies :run, 'execute[reload_tmux]', :delayed
  notifies :run, 'execute[install_plugins]', :delayed
end
