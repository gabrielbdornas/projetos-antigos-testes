class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.references :procedure_sub_group, presence: true
      t.string :cod, presence: true, uniqueness: true
      t.string :name, presence: true

      t.timestamps
    end
  end
end
