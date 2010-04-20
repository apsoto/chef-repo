#############################################################################
# Create swapfile since only small instances have swap by default
swapfile = node[:ec2opts][:swapfile]

unless swap_exists? 

  execute "create swapfile" do
    # swap equal to system memory
    command "dd if=/dev/zero of=#{swapfile} bs=1024 count=#{node[:memory][:total].to_i}" 
    creates swapfile
  end

  # make sure its not world readable
  execute "chmod 640 #{swapfile}" do
    # don't run if already has 0600 mode
    not_if { File.stat(swapfile).mode == 0100640 } 
  end

  # make it a swapfile
  execute "mkswap #{swapfile}" do
    not_if { swap_on?(swapfile) }
  end

  # turn on swap
  execute "swapon #{swapfile}" do
    not_if { swap_on?(swapfile) }
  end

end
