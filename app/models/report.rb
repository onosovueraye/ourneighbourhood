class Report < ApplicationRecord
  belongs_to :user
  has_many :follows
  has_many :comments
  has_many :tickets
  has_many_attached :photos
  validates :title, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 200 }
  # validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ['Improvement', 'Repair'] }
  validates :votes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :latitude, presence: true
  # validates :longitude, presence: true
  attribute :votes, :integer, default: 0

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
