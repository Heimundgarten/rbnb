class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  has_many :boardgames
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  def has_booking_to_review?
    self.bookings.select{ |booking| !booking.review }.any?
  end

  def structure_address(city, country, zip)
    "#{city}, #{country}, #{zip}"
  end
end
