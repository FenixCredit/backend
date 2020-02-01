class CreateGuarantees < ActiveRecord::Migration[5.2]
  def change
    create_table :guarantees, id: :uuid do |t|
      t.boolean :is_favourite, default: false
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.string :colony
      t.string :identification
      t.string :address_proof
      t.string :warning_letter
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
