class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :coach
      t.text :content
      t.references :admin_range, foreign_key: true
      t.references :range_outline, foreign_key: true

      t.timestamps
    end
  end
end
