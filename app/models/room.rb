class Room < ApplicationRecord
  UPDATETABLE_ATTRS = %i(name price description status bed size user_id
    room_view_id).push(images_attributes: [:imageable_id, :imageable_url,
    :imageable_type, :image, :_destroy]).freeze

  has_many :images, as: :imageable, dependent: :destroy
  has_many :booking_rooms, dependent: :destroy

  belongs_to :room_view

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true,
            length: {maximum: Settings.admin.room.name.max_length}
  validates :description, presence: true,
            length: {maximum: Settings.admin.room.description.max_length}
  validates :price, presence: true,
            numericality: {greater_than: Settings.admin.room.greater.min_length,
                           less_than: Settings.admin.room.less.max_length}
end
