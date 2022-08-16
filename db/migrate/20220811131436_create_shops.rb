class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :title
      t.text :body
      t.integer :end_user_id
      t.string :image_id
      t.integer :access
      t.string :other_image
      t.timestamps
    end
  end
end
