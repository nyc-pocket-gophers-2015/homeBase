json.members @family do |member|
  json.name member.name
  json.id member.id
  json.rewards member.rewards do |reward|
    if reward.status == "open"
    	json.reward_id reward.id
      json.name reward.name
      json.cost reward.cost
      json.category reward.category
    end
  end
end
