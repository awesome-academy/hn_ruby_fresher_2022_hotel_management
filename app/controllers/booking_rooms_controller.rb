class BookingRoomsController < ApplicationController
  before_action :find_by_room, only: :create

  def create
    @booking_room = current_user.booking_rooms.build booking_room_params
    @booking_room.user_id = current_user.id
    if @booking_room.save
      flash[:success] = t ".flash_succes"
    else
      flash[:error] = t ".flash_error"
    end
    redirect_to rooms_path
  end

  private

  def booking_room_params
    params.require(:booking_room).permit(BookingRoom::UPDATETABLE_ATTRS)
  end

  def find_by_room
    @room = Room.find_by(id: booking_room_params[:room_id])
  end
end
