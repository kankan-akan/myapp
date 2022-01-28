class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :lesson, foreign_key: true
      t.references :user, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
