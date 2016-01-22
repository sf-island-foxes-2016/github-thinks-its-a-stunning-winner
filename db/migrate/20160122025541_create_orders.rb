class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string     :status
      t.belongs_to :address
      t.belongs_to :financial_information
      t.belongs_to :cart

      t.timestamps null: false
    end
  end
end
