class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments, id: :uuid do |t|
      t.float :quantity, default: 0.0
      t.integer :status, default: 1
      t.references :client, type: :uuid, foreign_key: true
      t.references :loan, type: :uuid, foreign_key: true
      t.references :promoter, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
