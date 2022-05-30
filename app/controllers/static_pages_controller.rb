class StaticPagesController < ApplicationController
  def index
    @pagy, @rooms = pagy Room.all
    @pagy, @room_views = pagy RoomView.all
    @booking_room = BookingRoom.new
  end
end
