class BookingRoom < ApplicationRecord
  UPDATETABLE_ATTRS = %i(name phone_number from_date to_date
                         room_id description status).freeze

  belongs_to :user
  belongs_to :room

  class << self
    def filter_by_time from_date, to_date
      where("from_date >= ? AND to_date <= ?", from_date, to_date)
    end
  end

  enum status: {booking: 0, cancelled: 1}
end
