class BookingRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  class << self
    def filter_by_time from_date, to_date
      where("from_date >= ? AND to_date <= ?", from_date, to_date)
    end
  end

  enum status: {booking: 0, approve: 1, cancelled: 2}
end
