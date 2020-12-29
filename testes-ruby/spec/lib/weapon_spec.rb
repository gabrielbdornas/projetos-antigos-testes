require 'spec_helper'
require 'weapon'

describe Weapon do
  it 'Weapon tem nome' do
    weapon = Weapon.new(name: 'sword')
    expect(weapon.name).to eq('sword')
  end
  it 'Weapon current_power é igual à 3000' do
    weapon = Weapon.new(name: 'sword')
    expect(weapon.current_power).to eq(3000)
  end
  it 'Weapon current_power não é diferente à 3000' do
    weapon = Weapon.new(name: 'sword')
    expect(weapon.current_power).to_not eq(4000)
  end
end
