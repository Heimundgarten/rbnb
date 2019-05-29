class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    # @users = User.where.not(latitude: nil, longitude: nil)

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { user: user })
    #   }
    # end
    # raise
  end

  def show
  end

  def edit
  end

  def update
    @user = User.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :photo, :photo_cache)
  end
end
