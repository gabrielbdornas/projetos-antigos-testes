class CreateSourceLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :source_links do |t|
      t.references :post
      t.string :link
      t.boolean :mean

      t.timestamps
    end
  end
end
