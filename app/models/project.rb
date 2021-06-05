class Project < ApplicationRecord
  has_many: :users, through: :project_user
  has_many: :project_users
  has_many: :progresses
  has_many: :topics
  has_many: :calenders
end
