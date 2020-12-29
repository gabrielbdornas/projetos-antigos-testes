class CreateExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :examples do |t|
      t.references :page, foreign_key: true
      t.string :example_topic
      t.text :content
      t.string :partial

      t.timestamps
    end
  end
end
