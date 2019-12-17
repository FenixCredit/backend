class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :email
      t.string :password_digest
      t.string :contract
      t.string :picture
      t.integer :status, default: 1
      t.references :user, type: :uuid, foreign_key: true
      t.references :admin, type: :uuid, foreign_key: true
      t.references :role, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
