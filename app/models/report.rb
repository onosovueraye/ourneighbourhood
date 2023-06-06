class Report < ApplicationRecord
  belongs_to :user
  has_many :follows
  has_many :comments
  has_many :tickets
  has_many_attached :photos
end
