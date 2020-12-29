class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.references :hospital_group, presence: true
      t.string :initial, presence: true
      t.string :name, presence: true
      t.string :revenue_name, presence: true
      t.string :city, presence: true
      t.string :regionalization, presence: true
      t.string :port, presence: true

      t.timestamps
    end
  end
end

