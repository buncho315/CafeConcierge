class CreateShopGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_genres do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.timestamps
    end
  end
end
