class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :topic_comments
  has_many :notifications

  mount_uploader :image, ImageUploader
end
