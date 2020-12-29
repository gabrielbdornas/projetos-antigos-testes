class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.references :sub_category, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
