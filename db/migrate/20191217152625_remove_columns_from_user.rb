class RemoveColumnsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    remove_column :users, :profile_picture
    remove_column :users, :is_active
    remove_column :users, :preferences
    remove_column :users, :password_digest
  end
end
