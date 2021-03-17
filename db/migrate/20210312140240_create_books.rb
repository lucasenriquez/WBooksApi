class CreateBooks < ActiveRecord::Migration[5.2]
  def up
    create_table :books do |t|
      t.string :genre, null: false
      t.string :author, null: false
      t.string :image_url, null: false
      t.string :title, null: false
      t.string :publisher, null: false
      t.string :year, null: false

      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
