class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.boolean :uchihoudai, null: false, default: false
      t.boolean :approach,   null: false, default: false
      t.boolean :lefty,           null: false, default: false
      t.boolean :patting,       null: false, default: false
      t.boolean :bunker,       null: false, default: false
      t.boolean :shop,          null: false, default: false
      t.boolean :restaurant,  null: false, default: false
      t.boolean :lesson,        null: false, default: false
      t.references :range_outline, foreign_key: true

      t.timestamps
    end
  end
end
