json.array! @foods do |food|
  json.id      food.id
  json.name    food.name
  json.calorie food.calorie
end