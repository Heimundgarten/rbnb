class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  has_one :review, dependent: :destroy

  validates :date_borrowed, :date_returned, presence: true, allow_blank: false

  before_save :set_total_price

  def set_total_price
    daysborrowed = (date_returned.to_date - date_borrowed.to_date).to_i
    self.total_price = daysborrowed*self.boardgame.price_per_day
  end
end
