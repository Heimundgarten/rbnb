class Review < ApplicationRecord
  belongs_to :booking

  validates :content, :rating, presence: true, allow_blank: false

  def self.review_info(current_user)
    bookings = Booking.where(user: current_user).select { |booking| !booking.review}
    bookings.map! do |booking|
      ["#{booking.id}", "#{booking.boardgame.name}, from #{booking.date_borrowed} till #{booking.date_returned}"]
    end
    return bookings
  end
end
