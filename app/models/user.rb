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


end
