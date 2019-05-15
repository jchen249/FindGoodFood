Given /the following restaurants exist/ do |restaurants_table|
  restaurants_table.hashes.each do |restaurant|
    restaurant[:user_id] = 1
    Restaurant.create restaurant
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end
