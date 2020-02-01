class CreateGuaranteeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :guarantee_products, id: :uuid do |t|
      t.references :promissory_note, type: :uuid, foreign_key: true
      t.references :product, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
