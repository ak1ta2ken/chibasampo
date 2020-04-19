class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stroll
  paginates_per 30
end
