class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens, id: :uuid do |t|
      t.integer :token_type
      t.string :content
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
