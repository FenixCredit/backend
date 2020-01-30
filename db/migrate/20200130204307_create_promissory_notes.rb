class CreatePromissoryNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :promissory_notes, id: :uuid do |t|
      t.string :file
      t.string :code
      t.references :loan, type: :uuid, foreign_key: true
      t.references :guarantee, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
