class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins, id: :uuid do |t|
      t.string :email
      t.string :password_digest
      t.string :photo
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
