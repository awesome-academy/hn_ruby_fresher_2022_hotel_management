class AddColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :bed, :string
    add_column :rooms, :size, :string
  end
end
