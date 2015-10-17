#
# Cookbook Name:: dotfiles
# Recipe:: default
#

%w(bin bin/iso src src/go src/go/bin src/go/src).each do |dir|
  directory "/Users/miku/#{dir}" do
    user 'miku'
    mode '700'
    recursive true
  end
end
