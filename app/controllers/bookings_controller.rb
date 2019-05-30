class BookingsController < ApplicationController
  before_action :set_boardgame, except: :show

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @review = Review.new
  end

  def create
    @booking = Booking.new(booking_params)
    borrowed = params[:booking][:date_borrowed]
    returned = params[:booking][:date_returned]
    authorize @booking
    @booking.user = current_user
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
