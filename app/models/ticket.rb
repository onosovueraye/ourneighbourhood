class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :report
  has_many :notes
end
