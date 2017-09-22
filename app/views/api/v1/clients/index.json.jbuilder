json.clients @clients.includes(:room) do |c|
  json.id c.id
  json.room_id c.room.id
  json.name c.display_name
  json.first_name c.first_name
  json.last_name c.last_name
  json.phone_number c.phone_number.sub('+1', '')
  json.last_seen c.last_seen.strftime('%m/%d/%y')
end

json.message 'Clients Retrieved'