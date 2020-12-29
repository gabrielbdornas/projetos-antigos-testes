class CreateMunicipios < ActiveRecord::Migration[5.1]
  def change
    create_table :municipios do |t|
      t.references :estado
      t.string     :nome
      t.boolean    :capital, default: false

      t.timestamps
    end
  end
end
