class Admin::RoomViewsController < Admin::AdminController
  def index
    @pagy, @room_views = pagy RoomView.all
  end

  private
  def room_view_params
    params.require(:room_view).permit :name
  end
end
