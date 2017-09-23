json.messages @messages.includes(:user).each do |m|
  json.id m.id
  json.body m.body
  json.room_id m.room_id
  json.user_id m.user_id
  json.seen m.seen
  if m.user_id
    json.user m.user.display_name
  end
end