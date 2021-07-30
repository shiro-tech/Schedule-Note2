class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :progress_comments
  has_many :notifications
end
