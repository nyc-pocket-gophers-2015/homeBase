json.familyName @family.first.family.surname
json.members @family do |member|
  json.id member.id
  json.role member.role
  json.name member.name
  json.task_points member.task_points
  json.color member.color
  json.badges member.badges
  json.imgUrl member.img_url
  json.pendingRewards member.pending_rewards
  json.assignedTasks member.tasks_left_to_do do |task|
    json.task_id task.id
    json.title task.title
    json.point_value task.point_value
    json.assigned_member task.assigned_member.name
    json.deadline task.deadline
    json.complete task.complete
    if task.completed_member
      json.isComplete true
      json.completedMember task.completed_member.name
    end
  end
  json.completedTasks member.completed_tasks do |task|
   json.user task.title
   json.point_value task.point_value
   json.assigned_member task.assigned_member.name
   json.deadline task.deadline
   json.complete task.complete
   if task.completed_member

      json.completedMember task.completed_member.name
    end
  end
  json.events member.events do |event|
    json.title event.title
    json.eventDate event.event_date
    json.eventTime event.event_time
  end
end
json.unassignedTasks @family.first.unassigned_tasks

