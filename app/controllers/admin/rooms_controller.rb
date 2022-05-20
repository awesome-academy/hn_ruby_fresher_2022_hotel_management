class Admin::RoomsController < Admin::AdminController
  def index
    @pagy, @rooms = pagy Room.all, items: Settings.admin.room.pagy.max_length
  end

  def new
    @room = Room.new
    @image = @room.images.build
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = "Create success"
      redirect_to admin_rooms_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(Room::UPDATETABLE_ATTRS)
  end
end
