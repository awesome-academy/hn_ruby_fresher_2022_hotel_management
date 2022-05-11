class User < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :booking_rooms, dependent: :destroy
end
