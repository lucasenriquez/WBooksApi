class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def up
    create_table :book_suggestions do |t|
      t.references :user, foreign_key: true
      t.string :editorial, null: false
      t.float  :price, null: false
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :publisher, null: false
      t.string :year, null: false

      t.timestamps
    end
  end
  
  def down
    drop_table :book_suggestions
  end
end
