json.conversations @conversations.includes(:client).each do |c|
  json.id c.id
  json.open c.open
  json.notification c.notification
  json.client do
    json.id c.client.id
    json.name c.client.display_name
    json.first_name c.client.first_name
    json.last_name c.client.last_name
    json.phone_number c.client.phone_number.sub('+1', '')
    json.last_seen c.client.last_seen.strftime('%m/%d/%y')
  end
end