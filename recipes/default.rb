#
# Cookbook Name:: dotfiles
# Recipe:: default
#

include_recipe 'homebrewalt'
homebrewalt_tap 'caskroom/cask'
package 'brew-cask' do
  action :install
end

%w(bin bin/iso src src/go src/go/bin src/go/src).each do |dir|
  directory "/Users/miku/#{dir}" do
    user 'miku'
    mode '700'
    recursive true
  end
end
