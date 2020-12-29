class Procedure < ApplicationRecord
  belongs_to :procedure_sub_group
  has_many :out_syntheses
end
