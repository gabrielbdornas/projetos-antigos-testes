class CreateUnities < ActiveRecord::Migration[6.0]
  def change
    create_table :unities do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :address
      t.string :zip_code

      t.timestamps
    end
  end
end
