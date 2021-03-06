class CreateImportSyntetic < ActiveRecord::Migration[5.2]
  def change
    create_table :import_syntetics do |t|
      t.string :group
      t.references :import_info, foreign_key: true
      t.string :client_account_number
      t.integer :cliente_account_reduction
      t.string :client_account_description
      t.float :before_balance
      t.string :before_balance_type
      t.float :debit
      t.float :credit
      t.string :credit_type
      t.float :balance
      t.string :balance_type
      t.float :end_balance
      t.string :end_balance_type

      t.timestamps
    end
  end
end
