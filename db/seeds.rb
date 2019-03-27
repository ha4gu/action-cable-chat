(1..5).each do |i|
  User.create email: "user#{i}@example.com", password: 'P@ssw0rd'
end
