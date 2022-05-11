class Room < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  has_many :booking_rooms, dependent: :destroy

  belongs_to :user
  belongs_to :room_view
end
