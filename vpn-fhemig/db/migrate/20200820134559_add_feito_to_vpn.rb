class AddFeitoToVpn < ActiveRecord::Migration[5.2]
  def change
    add_column :vpns, :feito, :boolean, default: false
  end
end
