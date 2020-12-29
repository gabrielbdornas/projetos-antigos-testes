class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :hospital
  has_many :supplies
end
