class RoomsController < ApplicationController
  def index
    @room_views = RoomView.all
    @booking_room = BookingRoom.new
    @pagy, @rooms = pagy(
      Room.includes(:booking_rooms).search_by_status(params),
      items: Settings.user.controller.room.max_item
    )
  end

  private

  def find_room
    @room = Room.find_by id: params[:id]
    redirect_to admin_rooms_path unless @room
  end
end
