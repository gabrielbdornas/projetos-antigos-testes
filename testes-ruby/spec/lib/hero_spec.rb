require 'spec_helper'
require 'hero'

describe Hero do
  it 'has a sword' do
    hero = Hero.new
    expect(hero.weapon).to eq('sword')
  end

  # Desafio do heroi
  # https://www.youtube.com/watch?v=hC2XVkIs9wU&list=PLdDT8if5attGc3fgFsFe5cvV9MwlVFNLW&index=5
  it 'has more than 1000 HP Point' do
    hero = Hero.new
    # https://rubydoc.info/gems/rspec-expectations/frames
    expect(hero.hp_points).to be >= 1000
  end
end
