class RemoveAutherAndAdminFlagsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_admin, :boolean
    remove_column :users, :is_author, :boolean
  end
end
