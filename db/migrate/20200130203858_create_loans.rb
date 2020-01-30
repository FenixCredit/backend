class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans, id: :uuid do |t|
      t.float :quantity, default: 0.0
      t.integer :status, default: 1
      t.string :period
      t.references :client, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
