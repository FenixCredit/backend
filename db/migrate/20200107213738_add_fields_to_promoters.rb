class AddFieldsToPromoters < ActiveRecord::Migration[5.2]
  def change
    add_column :promoters, :comission, :float, default: 7.0
    add_column :promoters, :address, :string
  end
end
