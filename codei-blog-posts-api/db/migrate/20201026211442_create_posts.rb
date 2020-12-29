class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :resume
      t.string :content
      t.string :author
      t.string :reading_time
      t.string :github_link
      t.datetime :md_editing_date

      t.timestamps
    end
  end
end
