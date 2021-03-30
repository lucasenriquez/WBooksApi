class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def up
    create_table :book_suggestions do |t|
      t.references :user, foreign_key: true
      t.string :editorial, null: true
      t.float  :price, null: true
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :publisher, null: true
      t.string :year, null: true

      t.timestamps
    end
  end
  
  def down
    drop_table :book_suggestions
  end
end
