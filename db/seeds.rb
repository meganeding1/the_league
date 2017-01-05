require 'faker'
User.destroy_all
Sport.destroy_all
Team.destroy_all
Game.destroy_all
60.times do
  User.create({
    username: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    password: 'password',
    phone_number: Faker::PhoneNumber.phone_number
    })
end

5.times do
  Sport.create({
    name: Faker::Team.sport,
    description: Faker::Lorem.paragraph
    })
end

# 10.times do
#   Team.create({
#     name: Faker::Team.name,
#     user_id: User.all.sample.id,
#     sport_id: Sport.all.sample.id
#     })
# end

10.times do
  user = User.all.sample
  user.teams.create!({
      name: Faker::Team.name,
      user_id: user.id,
      sport_id: Sport.all.sample.id
      })
end

10.times do
  team1 = Team.all.sample
  team2 = Team.all.sample
  team1.games.create!({
      date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
      team_1: team1.name,
      team_2: team2.name
      })
end

# 20.times do
#   Game.create({
#     date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
#     team_1: Team.all.sample.name,
#     team_2: Team.all.sample.name
#     })
# end


# 5.times do
#   school_name = Faker::University.name
#   School.create({
#     name: school_name,
#     address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zipcode: Faker::Address.zip,
#     admin_code: "#{school_name}+a",
#     teacher_code: "#{school_name}+t"
#     })
# end
# 15.times do
#   Teacher.create({ name: Faker::Beer.name,
#                   email: Faker::Internet.email,
#                password: 'password',
#                   admin: false,
#                  school: School.all.sample
#     })
# end
# 30.times do
#   our_school = School.all.sample
#   Team.create({  name: Faker::GameOfThrones.character,
#                school: our_school,
#               teacher: our_school.teachers.sample
#     })
# end
# gender = %w[female male non-binary fluid]
# animal = %w[unicorn wolf elephant tiger eagle capybara racoon dragon mouse butterfly]
# shirts = %w[small, medium, large]
# 200.times do
#   our_school = School.all.sample
#     Student.create({
#                     school: our_school,
#                       team: our_school.teams.sample,
#                       name: Faker::Name.name,
#                      grade: rand(1..12),
#                     gender: gender.sample,
#                        GPA: (rand * (4) + 1).round(1),
#                 detentions: rand(0..5),
#                 fav_animal: animal.sample,
#                 shirt_size: shirts.sample,
#                  allergies: 'none',
#          emergency_contact: 'Mom'
#         })
# end
