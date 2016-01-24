class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.integer :stock
      t.integer :awaiting_shipment
      t.belongs_to :product

      t.timestamps null: false
    end
  end
end
