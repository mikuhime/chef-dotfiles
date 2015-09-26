#
# Cookbook Name:: dotfiles
# Recipe:: tmux
#

package 'tmux' do
end

directory '/Users/miku/.tmux' do
  mode '0700'
  owner 'miku'
end

directory '/Users/miku/.tmux/plugins' do
  mode '0700'
  owner 'miku'
  recursive true
end

git '/Users/miku/.tmux/plugins/tpm' do
  repository 'https://github.com/tmux-plugins/tpm'
  user 'miku'
end

execute 'reload_tmux' do
  action :nothing
  command 'tmux source /Users/miku/.tmux.conf'
  guard_interpreter :bash
  only_if 'tmux info &> /dev/null', user: 'miku'
  user 'miku'
end

cookbook_file '/Users/miku/.tmux.conf' do
  source 'tmux.conf'
  mode '0700'
  owner 'miku'
  notifies :run, 'execute[reload_tmux]', :delayed
end

# powerline dependencies
%w(python socat coreutils).each do |package|
  package package do
  end
end

homebrewalt_tap 'caskroom/fonts'
homebrew_cask 'font-sauce-code-powerline' do
end

%w(powerline-status psutil).each do |package|
  execute "install #{package}" do
    action :run
    command "pip install #{package}"
    guard_interpreter :bash
    not_if "pip show #{package}"
  end
end
