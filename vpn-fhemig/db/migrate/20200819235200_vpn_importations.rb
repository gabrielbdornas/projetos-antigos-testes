class VpnImportations < ActiveRecord::Migration[5.2]
  def change
    create_table :vpn_importations do |t|
      t.string :estacao_camg
      t.string :ip_renovado
      t.string :patrimonio
      t.string :mac
      t.string :host_name
    end
  end
end
