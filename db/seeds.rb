# if RAILS_ENV=development
#   User.destroy_all


10.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               image_url: 'no_image.png',
               avatar: 'no_image.png',
               uid: SecureRandom.uuid
              #  provider: n + 1
               )
end



n = 1
while n <= 10
  topic = Topic.create(
    title: "シード",
    content: "こんにちは！",
    user_id: n
  )
    k = 1
    while k <= 10
    topic.comments.create(
      content: "おはよう！",
      user_id: n,
      topic_id: topic.id
    )
    k = k + 1
   end
  n = n + 1
end

# n = 1
# while n <= 100
#   Comment.create(
#     content: "おはよう！",
#     user_id: n,
#     topic_id: n
#   )
#   n = n + 1
# end
