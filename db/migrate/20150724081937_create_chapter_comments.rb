class CreateChapterComments < ActiveRecord::Migration
  def change
    create_table :chapter_comments do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :novel, index: true, foreign_key: true
      t.references :chapter, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
