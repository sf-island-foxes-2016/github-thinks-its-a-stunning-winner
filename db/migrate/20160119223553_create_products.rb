class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :stock_count
      t.string :name
      t.float :price
      t.string :image
      t.string :category

      t.timestamps null: false
    end
  end
end
