class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report
  validates :description, presence: true, length: { maximum: 200 }
end
