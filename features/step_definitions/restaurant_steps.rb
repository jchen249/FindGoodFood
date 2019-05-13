Given /the following restaurants exist/ do |restaurants_table|
  restaurants_table.hashes.each do |restaurant|
    restaurant[:user_id] = 1
    Restaurant.create restaurant
  end
end