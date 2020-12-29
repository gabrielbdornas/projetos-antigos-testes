class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :state
      t.string     :name
      t.boolean    :capital, default: false

      t.timestamps
    end
  end
end
