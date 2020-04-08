class Comment < ApplicationRecord
  belongs_to :stroll
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { maximum: 140}
end
