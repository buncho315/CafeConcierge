class RenameUserIdColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :user_id, :end_user_id
  end
end
