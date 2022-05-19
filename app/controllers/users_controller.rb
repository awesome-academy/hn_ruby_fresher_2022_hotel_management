class UsersController < ApplicationController
  before_action :find_user, only: :show

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.create user_params
    if @user.save
      flash[:success] = t ".registration_success"
      redirect_to root_path
    else
      flash[:danger] = t ".registration_error"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(User::UPDATETABLE_ATTRS)
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end
end
