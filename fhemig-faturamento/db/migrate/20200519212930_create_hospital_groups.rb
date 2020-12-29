class CreateHospitalGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_groups do |t|
      t.string :name, presence: true

      t.timestamps
    end
  end
end
