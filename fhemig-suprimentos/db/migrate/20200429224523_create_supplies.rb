class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.references :iten, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
