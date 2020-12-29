class CreateEstados < ActiveRecord::Migration[5.1]
  def change
    create_table :estados do |t|
      t.string    :sigla
      t.string    :nome

      t.timestamps
    end
  end
end
