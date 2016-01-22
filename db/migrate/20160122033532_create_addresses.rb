class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :address_type
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
