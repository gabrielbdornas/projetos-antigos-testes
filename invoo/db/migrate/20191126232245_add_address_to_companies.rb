class AddAddressToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :state, :string
    add_column :companies, :zipcode, :string
    add_column :companies, :address, :string
    add_column :companies, :number, :string
    add_column :companies, :district, :string
    add_column :companies, :city, :string
    add_column :companies, :complement, :string
  end
end
