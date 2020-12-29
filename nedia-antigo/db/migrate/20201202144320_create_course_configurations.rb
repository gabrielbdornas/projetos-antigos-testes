class CreateCourseConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :course_configurations do |t|
      t.references :unity, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :modality
      t.boolean :status
      t.integer :semesters_duration
      t.string :period
      t.decimal :value

      t.timestamps
    end
  end
end
