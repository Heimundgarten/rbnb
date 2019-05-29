class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  has_many :reviews

  validates :date_borrowed, :date_returned, presence: true, allow_blank: false
end
