class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :progresses
  # has_many :progress_project, through: :progresses, source: 'project'
  has_many :topics
  has_many :calenders
  has_many :progress_comments
  has_many :topic_comments
  has_many :events
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
