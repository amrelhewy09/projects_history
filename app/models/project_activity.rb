class ProjectActivity < ApplicationRecord
  belongs_to :project
  belongs_to :user
  enum activity_type: { status_change: 0 }
end
