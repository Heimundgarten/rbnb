class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @boardgame = policy_scope(Boardgame)
    @boardgames = Boardgame.all

    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "users/infowindow", locals: { user: user })
      }
    end
  end

  def show
    @booking = Booking.new

    authorize @boardgame
    @review = Review.new
  end

  def new
    @boardgame = Boardgame.new
    authorize @boardgame
  end

  def create
    @user = User.find(current_user.id)
    @boardgame = Boardgame.new(boardgame_params)
    @boardgame.user = @user
    authorize @boardgame

    if @boardgame.save
      redirect_to boardgame_path(@boardgame)
    else
      render :new
    end
  end

  def edit
    authorize @boardgame
  end

  def update
    authorize @boardgame
    # @boardgame = Boardgame.update(boardgame_params)
    if @boardgame.update(boardgame_params)
      redirect_to boardgame_path(@boardgame)
    else
      render :edit
    end
  end

  def destroy
    authorize @boardgame
    @boardgame.destroy
    redirect_to boardgames_path
  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end

  def boardgame_params
    params.require(:boardgame).permit(:name, :description, :year, :price_per_day, :photo, :photo_cache)
  end
end
