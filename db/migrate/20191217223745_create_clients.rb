class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients, id: :uuid do |t|
      t.integer :client_type, default: 1
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.string :colony
      t.references :user, type: :uuid, foreign_key: true
      t.references :promoter, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
