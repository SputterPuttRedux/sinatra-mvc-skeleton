5.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
    )
end

5.times do |i|
  rand(4..10).times do
    User.find(i + 1).notes.create(
      complete: [true,false].sample,
      content: Faker::Lorem.paragraph
      )
  end
end


