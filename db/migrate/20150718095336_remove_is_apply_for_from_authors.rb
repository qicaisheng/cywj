class RemoveIsApplyForFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :is_apply_for, :boolean
    remove_column :authors, :is_right, :boolean
  end
end
