class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :lesson_time
      t.string :start_time1
      t.string :start_time2
      t.string :start_time3
      t.string :start_time4
      t.string :start_time5
      t.string :start_time6
      t.string :start_time7
      t.string :start_time8
      t.string :start_time9
      t.string :start_time10
      t.string :start_time11
      t.string :start_time12
      t.boolean :sun, default: false
      t.boolean :mon, default: false
      t.boolean :tue, default: false
      t.boolean :wed, default: false
      t.boolean :thu, default: false
      t.boolean :fri, default: false
      t.boolean :sat, default: false
      t.references :lesson, foreign_key: true
    
      t.timestamps
    end
  end
end
