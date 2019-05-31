class UsersController < ApplicationController
  before_action :set_user

  def show
    # @photo_button = raw("<i class="fas fa-camera"></i>")
    authorize @user
    @bookings = current_user.bookings
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    # @user = User.update(user_params)
    if @user.update(user_params)
      raise
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :photo, :photo_cache)
  end
end
