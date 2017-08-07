100.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end



n = 1
while n <= 100
  Topic.create(
    title: "シード",
    content: "こんにちは！",
    user_id: n
  )
  n = n + 1
end
