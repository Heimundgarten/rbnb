class ReviewsController < ApplicationController
  # before_action :set_booking #, except: [:destroy]

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
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    # @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to boardgame_path(@review.booking.boardgame)
      render :new
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to boardgame_path(@booking.boardgame)

  private

  # def set_booking
  #   @booking = booking.find(params[:booking_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
