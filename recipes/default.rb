#
# Cookbook Name:: dotfiles
# Recipe:: default
#

%w(bin src bin/iso).each do |dir|
  directory "/Users/miku/#{dir}" do
    user 'miku'
    mode '700'
    recursive true
  end
end
