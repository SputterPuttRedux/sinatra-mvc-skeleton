5.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_digest: "password"
    )
end

5.times do |i|
  rand(10).times do
    User.find(i + 1).lists.create(
      complete: [true,false].sample,
      title: Faker::Lorem.sentence
      )
  end
end

List.all.length.times do |i|
  rand(8).times do
    List.find(i + 1).items.create(
      complete: [true,false].sample,
      content: Faker::Lorem.word
      )
  end
end


