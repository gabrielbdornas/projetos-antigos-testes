class CreateImportations < ActiveRecord::Migration[5.2]
  def change
    create_table :importations do |t|
      t.string :aih
      t.string :id_principal
      t.string :alta
      t.string :mensagem_erro
      t.string :linha
      t.string :valor_previa

      t.timestamps
    end
  end
end
