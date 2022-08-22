class AddRateToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :rate, :float
  end
end
