class BookingRoom < ApplicationRecord
  UPDATETABLE_ATTRS = %i(name phone_number from_date to_date
                         room_id description status user_id).freeze

  belongs_to :user
  belongs_to :room

  scope :filter_by_time, (lambda do |from_date, to_date|
    where("from_date >= ? AND to_date <= ?", from_date, to_date) if from_date.present? && to_date.present?
  end)

  enum status: %i(pending booking check_in check_out cancelled)
end
