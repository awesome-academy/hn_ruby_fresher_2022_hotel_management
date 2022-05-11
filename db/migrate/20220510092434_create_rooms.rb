class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :status, default:0
      t.references :user, null: false, foreign_key: true
      t.references :room_view, null: false, foreign_key: true

      t.timestamps
    end
  end
end
