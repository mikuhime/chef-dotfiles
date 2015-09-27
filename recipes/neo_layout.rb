#
# Cookbook Name:: dotfiles
# Recipe:: neo_layout
#

homebrew_cask 'karabiner' do
end

remote_file '/Library/Keyboard Layouts/neo.keylayout' do
  source 'http://neo-layout.org/neo.keylayout'
end

remote_file '/Library/Keyboard Layouts/neo.icns' do
  source 'http://wiki.neo-layout.org/browser/mac_osx/neo.icns?format=raw'
end

remote_file '/Users/miku/Library/Application Support/Karabiner/private.xml' do
  source 'http://wiki.neo-layout.org/browser/mac_osx/private.xml?format=raw'
  mode '0700'
  owner 'miku'
  notifies :run, 'execute[karabiner_reload_xml]', :immediately
end

execute 'karabiner_reload_xml' do
  action :nothing
  command '/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml'
  user 'miku'
end

neo_settings = []
neo_settings << 'private.german_neo_bothshift_to_capslock'
neo_settings << 'private.german_neo_mod4'
neo_settings << 'remap.german_neo'
neo_settings.each do |setting|
  execute "neo_setting_#{setting}" do
    action :run
    command "/Applications/Karabiner.app/Contents/Library/bin/karabiner set #{setting} 1"
    not_if "/Applications/Karabiner.app/Contents/Library/bin/karabiner changed | grep #{setting}"
    user 'miku'
  end
end
