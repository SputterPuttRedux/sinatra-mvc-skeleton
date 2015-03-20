5.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_digest: "password"
    )
end