class User < ApplicationRecord
  has_many :strolls
  has_many :favorites, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 140 }
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
