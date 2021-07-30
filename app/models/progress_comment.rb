class ProgressComment < ApplicationRecord
  belongs_to :user
  belongs_to :progress
  has_many :notifications
end
