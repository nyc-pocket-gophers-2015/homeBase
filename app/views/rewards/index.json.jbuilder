json.members @family do |member|
  json.name member.name
  json.id member.id
  json.imgUrl member.img_url
  json.membercolor member.color
  json.points member.task_points
  json.pointscolor member.pointcolor
  json.rewards member.rewards do |reward|
    if reward.status == "open"
    	json.reward_id reward.id
      json.name reward.name
      json.cost reward.cost
    end
  end
end

