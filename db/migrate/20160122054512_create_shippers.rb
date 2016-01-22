class CreateShippers < ActiveRecord::Migration
  def change
    create_table :shippers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
