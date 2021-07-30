class Notification < ApplicationRecord
  belongs_to :project
  belongs_to :topic
  belongs_to :topic_comment
  belongs_to :progress
  belongs_to :progress_comment
  belongs_to :event

  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
