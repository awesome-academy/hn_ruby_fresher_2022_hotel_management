class BookingRoomsController < ApplicationController
  before_action :find_by_room, only: :create

  def create
    @booking_room = BookingRoom.new booking_room_params
    redirect_to rooms_path
    @booking_room.user_id = current_user.id
    if @booking_room.save
      flash[:success] = t ".flash_succes"
      redirect_to rooms_path
    else
      flash[:error] = t ".flash_error"
      render :index
    end
  end

  private

  def booking_room_params
    params.require(:booking_room).permit(BookingRoom::UPDATETABLE_ATTRS)
  end

  def find_by_room
    @room = Room.find_by(id: booking_room_params[:room_id])
  end
end
