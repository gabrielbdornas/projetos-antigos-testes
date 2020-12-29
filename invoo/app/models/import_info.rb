class ImportInfo < ApplicationRecord
  belongs_to :company_user
  has_many :import_accounts
  has_many :import_syntetics
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :company_user_id, presence: true
end
