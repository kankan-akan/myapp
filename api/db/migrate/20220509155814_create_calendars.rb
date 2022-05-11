class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :lesson_time
      t.text :start_time, array: true
      t.text :holiday, array: true
      t.references :lesson, foreign_key: true
    
      t.timestamps
    end
  end
end
