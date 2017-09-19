company = Company.create(name: Faker::Zelda.character)
valid_phone = ['8012982899', '9179872988', '3053993899', '3053993399', '3053991239', '4353748488']

user = company.users.create(email: 'user@test.com', password: 'password', first_name: 'user', last_name: 'test', role: 'admin')

valid_phone.each do |phone|
  client = company.clients.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: phone, last_seen: Time.now)
  if client.save
    rand(1..3).times do
      client.tasks.create(name: Faker::Color.color_name, action: 'go', due_date: Faker::Date.forward(rand(3..28)), body: Faker::Hacker.say_something_smart, status: 'open')
    end
  end
end