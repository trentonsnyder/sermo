agency = Agency.create(name: Faker::Zelda.character)

team1 = agency.teams.create(name: Faker::DragonBall.character)
team2 = agency.teams.create(name: Faker::DragonBall.character)

user = User.create(email: 'user@test.com', password: 'password', first_name: 'user', last_name: 'test', role: 'admin')
user.user_teams.create(team_id: team1.id)
user.user_teams.create(team_id: team2.id)

7.times do
  Client.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number)
end

Client.all.each do |c|
  c.client_teams.create(team_id: team1.id)
  c.client_teams.create(team_id: team2.id) if [0,1].sample
end

