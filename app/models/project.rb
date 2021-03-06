class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users
  has_many :progresses
  has_many :topics
  has_many :events
  has_many :notifications
end
