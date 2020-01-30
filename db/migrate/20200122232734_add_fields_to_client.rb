class AddFieldsToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :identification, :string
    add_column :clients, :address_proof, :string
    add_column :clients, :warning_letter, :string
  end
end
