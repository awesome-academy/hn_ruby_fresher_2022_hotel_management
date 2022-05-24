class Admin::BookingRoomsController < Admin::AdminController
  before_action :find_booking_room, only: :update

  def index
    @pagy, @booking_rooms = pagy BookingRoom.all
  end

  def update
    if @booking_room.status == "booking"
      @booking_room.update(status: 1)
    else
      @booking_room.update(status: 0)
    end
    redirect_to admin_booking_rooms_path
  end
  private

  def find_booking_room
    @booking_room = BookingRoom.find_by id: params[:id]
    redirect_to admin_booking_rooms_path unless @booking_room
  end
end
