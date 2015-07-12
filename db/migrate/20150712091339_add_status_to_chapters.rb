class AddStatusToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :status, :integer
  end
end
