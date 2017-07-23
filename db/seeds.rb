User.create!(name:  "Ashray Sudhir", email: "ashraysudhir1@gmail.com", password: "founder", password_confirmation: "founder")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name, email: email, password: password, password_confirmation: password)
end
