class CreateSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
