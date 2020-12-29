class RemoveCreditTypeToImportAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :import_accounts, :credit_type
  end
end
