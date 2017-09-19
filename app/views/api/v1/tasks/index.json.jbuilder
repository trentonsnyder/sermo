json.tasks @tasks.includes(:client).each do |task|
  json.name task.name
  json.action task.action
  json.body task.body
  json.due_date task.due_date
  json.status task.status
  json.client do
    json.id task.client.id
    json.name task.client.display_name
  end
end