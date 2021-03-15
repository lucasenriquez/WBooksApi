class CreateRents < ActiveRecord::Migration[5.2]
  def up
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
  def down
    drop_table :rents
  end
end
