company = Company.create(name: Faker::Zelda.character)

user = company.users.create(email: 'user@test.com', password: 'password', first_name: 'user', last_name: 'test', role: 'admin')

7.times do
  company.clients.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, last_seen: Time.now)
end