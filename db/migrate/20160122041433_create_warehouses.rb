class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.integer :product_id
      t.integer :stock

      t.timestamps null: false
    end
  end
end
