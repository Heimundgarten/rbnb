class Review < ApplicationRecord
  belongs_to :booking

  validates :content, :rating, presence: true, allow_blank: false
end
