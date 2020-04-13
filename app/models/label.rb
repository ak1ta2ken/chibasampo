class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :users, through: :labelings
  validates :label_name, presence: true
  validates :label_name, length: { maximum: 15 }
end
