class CreateRangeOutlines < ActiveRecord::Migration[5.2]
  def change
    create_table :range_outlines do |t|
      t.string :city
      t.string :name
      t.text :features
      t.string :link
      t.string :address
      t.string :phone_number
      t.string :distance
      t.string :booths
      t.string :image
      t.references :admin_range, foreign_key: true

      t.timestamps
    end
  end
end
