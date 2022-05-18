class RoomView < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true,
            length: {maximum: Settings.admin.room_view.name.max_length}
end
