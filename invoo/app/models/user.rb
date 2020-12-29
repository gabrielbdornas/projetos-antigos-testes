class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :company_users
  has_many :orders

  has_many :companies, through: :company_users
  validates :email, presence: true
  validates :email, uniqueness: true
end
