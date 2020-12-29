class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.references :manteiner, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
