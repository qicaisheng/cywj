class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :number
      t.string :name
      t.text :content
      t.string :keywords
      t.references :novel, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
