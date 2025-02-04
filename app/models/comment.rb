class Comment < ApplicationRecord
  paginates_per 5
  belongs_to :project
  belongs_to :user
  validates :content, presence: true
end
