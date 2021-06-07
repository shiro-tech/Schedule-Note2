class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

  has_many :projects, through: :project_user
  has_many :project_users
  has_many :progresses
  has_many :topics
  has_many :calenders
end
