class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :state
      t.float :rate

      t.timestamps null: false
    end
  end
end
