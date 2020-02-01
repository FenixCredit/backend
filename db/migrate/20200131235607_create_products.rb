class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.float :value, default: 0.0
      t.string :photo

      t.timestamps
    end
  end
end
