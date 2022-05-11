class CreateRoomViews < ActiveRecord::Migration[6.1]
  def change
    create_table :room_views do |t|
      t.string :name

      t.timestamps
    end
  end
end
