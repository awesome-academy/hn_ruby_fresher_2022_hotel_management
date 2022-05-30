class Admin::BookingRoomsController < Admin::AdminController
  before_action :find_booking_room, only: %i(update destroy)

  def index
    @pagy, @booking_rooms = pagy BookingRoom.all
  end

  def update
    @booking_room.update booking_params[:status]
  end

  def destroy
    if @booking_room.destroy
      flash[:success] = t ".flash_sucsses"
    else
      flash[:error] = t ".flash_error"
    end
  end

  private

  def find_booking_room
    @booking_room = BookingRoom.find_by id: params[:id]
    redirect_to admin_booking_rooms_path unless @booking_room
  end

  def booking_params
    params.require(:booking_room).permit(BookingRoom::UPDATETABLE_ATTRS)
  end
end
