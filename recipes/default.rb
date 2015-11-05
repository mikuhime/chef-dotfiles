#
# Cookbook Name:: dotfiles
# Recipe:: default
#

%w(bin bin/iso src src/go src/go/bin src/go/src).each do |dir|
  directory "/Users/#{node['dotfiles']['user']}/#{dir}" do
    user node['dotfiles']['user']
    mode '700'
    recursive true
  end
end
