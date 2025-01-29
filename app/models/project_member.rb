class ProjectMember < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :role, inclusion: { in: %w[admin member] }
end
