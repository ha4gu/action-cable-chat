class Post < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true
  after_create_commit { BroadcastNewPostJob.perform_later self }
end
