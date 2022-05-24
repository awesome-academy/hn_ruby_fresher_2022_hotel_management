class RoomsController < ApplicationController
  def index
    @pagy, @room_views = pagy RoomView.all
    @pagy, @rooms = pagy Room.all, items:
                         Settings.user.controller.room.max_item
  end

  private

  def find_room
    @room = Room.find_by(id: params[:id])
    redirect_to admin_rooms_path unless @room
  end
end
