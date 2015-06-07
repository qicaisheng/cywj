class AddUserReferenceToAuthors < ActiveRecord::Migration
  def change
    add_reference :authors, :user, index: true
    add_column :authors, :is_right, :boolean
  end
end
