class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :stock_count
      t.string :name
      t.float :price
      t.string :image
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
