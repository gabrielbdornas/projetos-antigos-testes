class AddEmailToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_email, :string
  end
end
