class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user
      t.references :follower, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :relationships, [:user_id, :follower_id], unique: true
  end
end
