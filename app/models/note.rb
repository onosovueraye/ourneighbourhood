class Note < ApplicationRecord
  belongs_to :ticket
  validates :description, presence: true, length: { maximum: 200 }
  has_many_attached :photos
end
