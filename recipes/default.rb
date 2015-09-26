#
# Cookbook Name:: dotfiles
# Recipe:: default
#

%w(bin src).each do |dir|
  directory "/Users/miku/#{dir}" do
  end
end
