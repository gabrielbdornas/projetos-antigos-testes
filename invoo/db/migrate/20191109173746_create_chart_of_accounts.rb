class CreateChartOfAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :chart_of_accounts do |t|
      t.string :account_number
      t.string :group
      t.string :sub_group
      t.string :account
      t.string :nature

      t.timestamps
    end
  end
end
