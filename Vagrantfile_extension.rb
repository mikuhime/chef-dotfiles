Vagrant.configure(2) do |config|
  config.vm.provider "parallels" do |prl|
    prl.use_linked_clone = true
  end
end
