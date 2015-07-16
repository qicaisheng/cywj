class AddUserReferenceToAuthors < ActiveRecord::Migration
  def change
    add_reference :authors, :user, index: true
  end
end
