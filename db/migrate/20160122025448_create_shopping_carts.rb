class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
