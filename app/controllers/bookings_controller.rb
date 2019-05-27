class BookingsController < ApplicationController
  before_action :set_boardgame

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boardgame = @boardgame

    if @booking.save
      redirect_to boardgame_path(@boardgame)
    else
      render :new
    end
  end

  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:boardgame_id])
  end

  def booking_params
    params.require(:booking).permit(:date_borrowed, :date_returned)
  end
end
