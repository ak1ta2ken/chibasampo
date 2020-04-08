class User < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label
  def update_without_current_password(params)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params)
    clean_up_passwords
    result
  end
  has_many :strolls
  has_many :favorites, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  validates :profile, length: { maximum: 140 }
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
