class Course < ApplicationRecord
  belongs_to :level
  has_many :course_configurations
end
