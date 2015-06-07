class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :name
      t.string :type
      t.string :cover
      t.string :keywords
      t.string :description
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
