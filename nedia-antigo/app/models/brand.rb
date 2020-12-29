class Brand < ApplicationRecord
  belongs_to :manteiner
  has_many :unities
end
