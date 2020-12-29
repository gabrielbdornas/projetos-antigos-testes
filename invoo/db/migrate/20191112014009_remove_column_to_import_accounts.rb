class RemoveColumnToImportAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :import_accounts, :balance_type
  end
end
