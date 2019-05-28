class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    # @user = User.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user), alert: 'Your profile was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to root_path, alert: 'Your profile was successfully deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :photo, :photo_cache)
  end
end
