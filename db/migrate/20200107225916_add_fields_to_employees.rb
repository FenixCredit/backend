class AddFieldsToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :salary, :float, default: 0.0
    add_column :employees, :address, :string
  end
end
