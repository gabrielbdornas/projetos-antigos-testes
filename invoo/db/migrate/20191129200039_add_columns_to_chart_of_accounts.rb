class AddColumnsToChartOfAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :chart_of_accounts, :group_number, :integer
    add_column :chart_of_accounts, :sub_group_number, :integer
  end
end
