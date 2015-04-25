json.array! @lists do |list|
  json.id list.id
  json.name list.name
  json.tasks list.tasks do |task|
    json.id task.id
    json.name task.name
    json.due_date task.due_date
    json.completed task.completed
    json.list_id task.list_id
    json.position task.position
    json.comments task.comments do |comment|
      json.id comment.id
      json.name comment.name
    end
  end
end