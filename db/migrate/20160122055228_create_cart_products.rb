class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.float :quoted_price
      t.integer :quantity
      t.belongs_to :cart
      t.belongs_to :product

      t.timestamps null: false
    end
  end
end
