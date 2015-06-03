json.array!(@events) do |event|
  json.title event.title
  json.start event.start_time
  json.end event.end_time
  if event.member
    json.color event.member.color
  end
  json.id event.id
end
