class ReviewsController < ApplicationController
  before_action :set_booking #, except: [:destroy]

  def show
    @reviews = Review.all
  end

  def new
    @review = Review.new
    authorize @review
  end

  # not so sure on this method, please review carefully
  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to boardgame_path(@booking.boardgame), alert: 'Your review was successfully added'
    else
      render :new
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to boardgame_path(@booking.boardgame), alert: 'Your review was successfully deleted'
  end

  private

  def set_booking
    @booking = booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
