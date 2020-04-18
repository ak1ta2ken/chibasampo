class Stroll < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :title, length: { maximum: 28}
  validates :content, presence: true
  validates :content, length: { maximum: 140}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  paginates_per 30
end
