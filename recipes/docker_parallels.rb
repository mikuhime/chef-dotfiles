%w(parallels dockertoolbox).each do |cask|
  homebrew_cask cask do
  end
end

remote_file '/usr/local/bin/docker-machine' do
  source 'https://github.com/Parallels/docker-machine/releases/download/parallels%2F0.4.0-1/docker-machine_darwin-amd64'
  mode '755'
  group 'admin'
  user 'miku'
end
