class RoomView < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
