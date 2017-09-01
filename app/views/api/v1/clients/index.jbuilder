json.clients @clients do |c|
  json.id c.id
  json.name c.display_name
  json.phone_number c.phone_number
  json.last_seen c.last_seen.strftime('%m/%d/%y')
end

json.message 'Clients Retrieved'