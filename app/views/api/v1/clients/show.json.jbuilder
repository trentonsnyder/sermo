json.client do
  json.id @client.id
  json.name @client.display_name
  json.first_name @client.first_name
  json.last_name @client.last_name
  json.phone_number @client.phone_number.sub('+1', '')
  json.last_seen @client.last_seen.strftime('%m/%d/%y')
end