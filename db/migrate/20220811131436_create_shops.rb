class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :end_user_id
      t.string :image_id
      t.string :access, null: false
      t.string :other_image
      t.timestamps
    end
  end
end
