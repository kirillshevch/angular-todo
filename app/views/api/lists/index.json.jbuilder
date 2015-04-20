json.array! @lists do |list|
  json.id list.id
  json.name list.name
  json.tasks list.tasks
end