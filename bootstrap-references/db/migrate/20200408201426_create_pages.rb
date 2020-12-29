class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :page_topic
      t.text :content
      t.text :you_tube_link

      t.timestamps
    end
  end
end
