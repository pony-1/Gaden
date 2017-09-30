# if RAILS_ENV=development
#   User.destroy_all

1.times do
  email = Faker::Internet.email
  name = Faker::Name.name
  password = 'password'
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: SecureRandom.uuid)
  #  provider: n + 1
end

n = 1
while n <= 1
  topic = Topic.create(
    title: '私は死ぬ前に海を見たい',
    user_id: n
  )
  k = 1
  while k <= 1
    topic.comments.create(
      content: 'いいですね',
      user_id: n,
      topic_id: topic.id
    )
    k += 1
  end
  n += 1
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
