class AddIsShowToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :is_show, :boolean
  end
end
