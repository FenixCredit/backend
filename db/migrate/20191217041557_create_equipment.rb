class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment, id: :uuid do |t|
      t.string :code
      t.string :name
      t.float :cost
      t.string :photo
      t.integer :type
      t.references :admin, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
