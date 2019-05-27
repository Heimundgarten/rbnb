class Boardgame < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :booking

  validates :name, :description, :price_per_day, presence: true, allow_blank: false
end
