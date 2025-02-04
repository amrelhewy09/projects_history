class Project < ApplicationRecord
  paginates_per 5
  has_many :comments
  has_many :project_activities

  enum status: { to_do: 0, in_progress: 1, in_review: 2, done: 3 }
end
