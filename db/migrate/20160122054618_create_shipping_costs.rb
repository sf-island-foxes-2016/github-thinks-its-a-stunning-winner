class CreateShippingCosts < ActiveRecord::Migration
  def change
    create_table :shipping_costs do |t|
      t.float :cost

      t.timestamps null: false
    end
  end
end
