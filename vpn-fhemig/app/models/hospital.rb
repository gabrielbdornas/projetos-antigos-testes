class Hospital < ApplicationRecord
  belongs_to :hospital_group
  has_many :out_syntheses
end
