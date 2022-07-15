class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.float :rate
      t.integer :reservation_id, null: false
      t.references :lesson, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
