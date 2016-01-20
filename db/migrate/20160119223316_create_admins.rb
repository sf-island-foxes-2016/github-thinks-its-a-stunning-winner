class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username, null: false
      t.string :password_hash, null: false

      t.timestamps null: false
    end
  end
end
