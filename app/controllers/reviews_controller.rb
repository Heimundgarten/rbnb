class ReviewsController < ApplicationController
  before_action :set_booking #, except: [:destroy]

  def show
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to boardgame_path(@booking.boardgame)
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to boardgame_path(@booking.boardgame)
  end

  private

  def set_booking
    @booking = booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
