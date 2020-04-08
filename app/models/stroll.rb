class Stroll < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  # validates :image, presence: { message: "を選択してください"}
  validates :title, presence: true
  validates :title, length: { maximum: 28}
  validates :content, presence: true
  validates :content, length: { maximum: 140}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
