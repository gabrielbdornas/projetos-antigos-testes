class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :company_name

      t.timestamps
    end
  end
end
