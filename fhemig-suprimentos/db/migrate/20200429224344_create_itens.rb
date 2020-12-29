class CreateItens < ActiveRecord::Migration[5.2]
  def change
    create_table :itens do |t|
      t.string :siad_code
      t.string :name

      t.timestamps
    end
  end
end
