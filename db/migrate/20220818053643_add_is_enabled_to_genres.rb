class AddIsEnabledToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :is_enabled, :boolean
  end
end
