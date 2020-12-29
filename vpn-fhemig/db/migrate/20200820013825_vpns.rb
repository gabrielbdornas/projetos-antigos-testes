class Vpns < ActiveRecord::Migration[5.2]
  def change
      create_table :vpns do |t|
        t.string :entidade
        t.string :unidade
        t.string :nome
        t.string :cpf
        t.string :justificativa
        t.string :ip_antigo
        t.string :estacao_camg
        t.string :estacao_camg_renovada
        t.string :ip_renovado
      end
    end
end
