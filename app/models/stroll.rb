class Stroll < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :title, presence: true
  validates :title, length: {in: 1..28}
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
