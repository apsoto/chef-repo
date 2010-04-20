module Ec2ExtraHelper
  def swap_exists?
    `swapon -s | wc -l`.to_i > 1
  end

  def swap_on?(device)
    return system("swapon -s | grep #{device}")
  end
end

class Chef::Resource
  include Ec2ExtraHelper
end

class Chef::Recipe
  include Ec2ExtraHelper
end
