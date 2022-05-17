class Admin::RoomsController < Admin::AdminController
  def index
    @pagy, @rooms = pagy(Room.all, items: Settings.admin.room.pagy.max_length)
  end

  private
  def room_params
    params.require(:room).permit(Room::UPDATETABLE_ATTRS)
  end
end
