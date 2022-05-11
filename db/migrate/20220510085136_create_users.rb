class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated, default:false
      t.datetime :activated_at
      t.boolean :admin, default: false
      t.string :reset_digest
      t.datetime :reset_send_at

      t.timestamps
    end
  end
end
