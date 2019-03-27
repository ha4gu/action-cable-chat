(1..5).each do |i|
  User.create email: "user#{i}@example.com", password: 'P@ssw0rd'
  Room.create name: "Room #{i}"
end

(1..5).each do |i|
  (1..5).each do |j|
    Post.create room_id: j, user_id: i, content: "test post #{i} by user#{i}"
  end
end
