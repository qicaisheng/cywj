class AddStatusToAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :is_applay_for, :boolean
    remove_column :authors, :is_right, :boolean
    add_column :authors, :status, :integer
  end
end
