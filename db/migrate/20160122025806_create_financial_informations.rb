class CreateFinancialInformations < ActiveRecord::Migration
  def change
    create_table :financial_informations do |t|
      t.integer :card_num
      t.integer :expiry
      t.integer :ccid
      t.integer :address_id
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
