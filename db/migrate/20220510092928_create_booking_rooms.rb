class CreateBookingRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :description
      t.integer :status, default: 0
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
