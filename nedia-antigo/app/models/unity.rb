class Unity < ApplicationRecord
  belongs_to :brand
  has_many :course_configurations
end
