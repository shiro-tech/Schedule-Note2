class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :topic_comments
end
