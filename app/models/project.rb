class Project < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :project_members
  has_many :members, through: :project_members, source: :user

  validates :title, :description, presence: true
end
