json.message do
  json.id @message.id
  json.body @message.body
  json.client_id @message.client_id
  json.user_id @message.user_id
  json.seen @message.seen
  if @message.user_id
    json.user @message.user.display_name
  end
end