class AddLinkToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :link, :string
  end
end
