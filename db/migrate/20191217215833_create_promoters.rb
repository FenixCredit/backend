class CreatePromoters < ActiveRecord::Migration[5.2]
  def change
    create_table :promoters, id: :uuid do |t|
      t.string :aka
      t.string :contract
      t.references :user, type: :uuid, foreign_key: true
      t.references :employee, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
