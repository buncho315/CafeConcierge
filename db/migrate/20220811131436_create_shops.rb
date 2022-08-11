class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :title
      t.text :body
      t.integer :end_user_id

      t.timestamps
    end
  end
end
