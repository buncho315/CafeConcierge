class AddProfileImageToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :profile_image, :string
  end
end
