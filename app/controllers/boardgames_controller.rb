class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :edit, :destroy]

  def index
    @boardgames = Boardgame.all
  end

  def show
  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    @user = User.find(params[:user_id])
    @boardgame = Boardgame.create(boardgame_params)
    raise
    if @boardgame.save
      redirect_to boardgame_path(@boardgame)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @boardgame = Boardgame.update(boardgame_params)
    if @boardgame.save
      redirect_to boardgame_path(@boardgame)
    else
      render :edit
    end
  end

  def destroy
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
