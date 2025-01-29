class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :projects, foreign_key: :creator_id
  has_many :project_members
  has_many :shared_projects, through: :project_members, source: :project
end
