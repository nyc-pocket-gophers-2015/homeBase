json.members @family do |member|
  json.name member.name
  json.rewards member.rewards do |reward|
    if reward.status == "open"
      json.name reward.name
      json.cost reward.cost
      json.category reward.category
    end
  end
end
