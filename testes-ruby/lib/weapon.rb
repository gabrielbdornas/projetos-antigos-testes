class Weapon
  attr_accessor :name, :description, :power_base, :power_step, :level

  def initialize (attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @power_base = 3000
    @power_step = 100
    @level = 1
  end

  def current_power
    (power_base + ((level-1)*power_step))
  end

  def titel
    "#{@name}##{@level}"
  end
end
