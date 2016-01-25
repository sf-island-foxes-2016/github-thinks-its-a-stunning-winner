class CreateFinancialInformations < ActiveRecord::Migration
  def change
    create_table :financial_informations do |t|
      t.string :card_num
      t.string :expiry
      t.integer :ccid
      t.belongs_to :address
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
