class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame

  validates :date_borrowed, :date_returned, presence: true, allow_blank: false
end
