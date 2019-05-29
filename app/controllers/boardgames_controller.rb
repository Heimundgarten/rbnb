class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :edit, :update, :destroy]

  def index
    @boardgame = policy_scope(Boardgame)
    @boardgames = Boardgame.all
  end

  def show
    authorize @boardgame
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
      redirect_to boardgame_path(@boardgame), alert: 'The boardgame was successfully added'
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
      redirect_to boardgame_path(@boardgame), alert: 'The boardgame was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @boardgame
    @boardgame.destroy
    redirect_to boardgames_path, alert: 'The boardgame was successfully deleted'
  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end

  def boardgame_params
    params.require(:boardgame).permit(:name, :description, :year, :price_per_day, :photo, :photo_cache)
  end
end
