class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reports
  has_many :follows
  has_many :comments
  has_many :tickets
  validates :name, presence: true
  validates :address, presence: true
  validates :neighbourhood, presence: true
end
