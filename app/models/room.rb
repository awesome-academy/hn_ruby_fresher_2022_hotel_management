class Room < ApplicationRecord
  UPDATETABLE_ATTRS =
    %i(name price description status user_id room_view_id).freeze

  has_many :images, as: :imageable, dependent: :destroy
  has_many :booking_rooms, dependent: :destroy

  belongs_to :user
  belongs_to :room_view
end
