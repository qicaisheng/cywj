class AddStatusToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :status, :integer
  end
end
