json.clients @clients.includes(:teams) do |c|
  json.id c.id
  json.name c.display_name
  json.phone_number c.phone_number
  json.last_seen t.last_seen
end