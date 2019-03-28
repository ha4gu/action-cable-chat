class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_room_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Post.create content: data['content'],
      room_id: params['room'], user_id: current_user.id
  end
end
