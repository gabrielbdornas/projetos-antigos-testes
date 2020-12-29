class ChangeSubGroupNumberToChartOfAccounts < ActiveRecord::Migration[5.2]
  def change
    change_column :chart_of_accounts, :sub_group_number, :string
  end
end
