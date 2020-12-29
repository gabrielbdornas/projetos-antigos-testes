class AddSystemToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :report_system, :string
  end
end
