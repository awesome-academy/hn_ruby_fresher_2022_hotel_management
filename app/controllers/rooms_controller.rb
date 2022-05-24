class RoomsController < ApplicationController
  def index
    @pagy, @room_views = pagy RoomView.all
    @pagy, @rooms = pagy(
      Room.search_by_room_view(params).search_by_status(params),
      items: Settings.user.controller.room.max_item
    )
    @booking_room = BookingRoom.new
  end

  private

  def find_room
    @room = Room.find_by id: params[:id]
    redirect_to admin_rooms_path unless @room
  end
end
