class BroadcastNewPostJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "chat_channel_room_#{data.room_id}",
      message: data.content, room_id: data.room_id, user_id: data.user.email
  end
end
