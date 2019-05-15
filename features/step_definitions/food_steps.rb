Given /the following foods exist/ do |foods_table|
  foods_table.hashes.each do |food|
    food[:restaurant_id] = 1
    Food.create food
  end
end