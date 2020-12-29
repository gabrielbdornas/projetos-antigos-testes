class CreateProcedureGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :procedure_groups do |t|
      t.string :cod, presence: true, uniqueness: true
      t.string :name, presence: true

      t.timestamps
    end
  end
end
