class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true, allow_blank: false
  validates :rating, presence: true, allow_blank: false, inclusion: { in: [ 0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }


  def self.review_info(current_user)
    bookings = Booking.where(user: current_user).select { |booking| !booking.review}
    bookings.map! do |booking|
      ["#{booking.id}", "#{booking.boardgame.name}, from #{booking.date_borrowed} till #{booking.date_returned}"]
    end
    return bookings
  end
end
