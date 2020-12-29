# https://stackoverflow.com/questions/29538530/getting-error-indicating-number-is-out-of-range-for-activerecordtypeinteger
class ChangeIntegerLimitInImportAccounts < ActiveRecord::Migration[5.2]
  def change
    change_column :import_accounts, :cliente_account_reduction, :integer, limit: 8
  end
end
