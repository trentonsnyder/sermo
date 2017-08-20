json.clients @clients.includes(:teams) do |c|
  json.id c.id
  json.name c.display_name
  json.phone_number c.phone_number
  json.emails t.emails
  json.last_seen t.last_seen
  json.teams c.teams.each do |t|
    json.id t.id
    json.name t.name
  end
end