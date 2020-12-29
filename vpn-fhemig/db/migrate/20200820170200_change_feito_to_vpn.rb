class ChangeFeitoToVpn < ActiveRecord::Migration[5.2]
  def change
    add_column :vpns, :observacao, :text
  end
end
