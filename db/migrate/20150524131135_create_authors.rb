class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :mobile
      t.string :job
      t.string :major
      t.text :description

      t.boolean :is_apply_for
      t.timestamps null: false
    end
  end
end
