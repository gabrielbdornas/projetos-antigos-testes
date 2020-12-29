class Level < ApplicationRecord
  belongs_to :sub_category
  has_many :courses
end
