class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :address_id
      t.belongs_to :billing_information_id
      t.belongs_to :cart
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
