class CreateOutSyntheses < ActiveRecord::Migration[5.2]
  def change
    create_table :out_syntheses do |t|
      t.references :hospital, presence: true
      t.references :procedure, presence: true
      t.date :competence, presence: true
      t.integer :sheet, presence: true
      t.integer :sequence, presence: true
      t.string :cbo, presence: true
      t.integer :quantity_presented, presence: true
      t.float :value_presented, presence: true
      t.integer :quantity__approved, presence: true
      t.float :value_approved, presence: true
      t.string :situation, presence: true

      t.timestamps
    end
  end
end
