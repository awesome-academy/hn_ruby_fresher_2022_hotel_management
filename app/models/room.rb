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

  scope :filter_room_view, (lambda do |room_view_id|
      where(room_view_id: room_view_id) if room_view_id.present?
  end)

  scope :search_by_status, (lambda do |params|
    return unless params[:from_date].present? && params[:to_date].present? && params[:status]

    room_ids = BookingRoom.filter_by_time(params[:from_date],
                                          params[:to_date])
    where.not(id: room_ids)
  end)

  def display_image
    image.variant resize_to_limit: Settings.models.room
  end
end
