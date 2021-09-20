class RenamePasswardColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passward, :password
  end
end
