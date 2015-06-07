class AddOtherFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_author, :boolean
    add_column :users, :is_admin, :boolean
    add_column :users, :mobile, :string
    add_column :users, :job, :string
    add_column :users, :major, :string
  end
end
