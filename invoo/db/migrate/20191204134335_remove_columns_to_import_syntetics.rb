class RemoveColumnsToImportSyntetics < ActiveRecord::Migration[5.2]
  def change
    remove_column :import_syntetics, :credit_type
    remove_column :import_syntetics, :balance_type
  end
end
