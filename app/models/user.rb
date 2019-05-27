class User < ApplicationRecord
  has_many :boardgames
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, :last_name, :address, presence: true, allow_blank: false
end
