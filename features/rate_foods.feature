@omniauth_test
Feature: test creation and modification of Food
 
    As a user,
    So that I can have ownership of a restaurants menu,
    I want the ability to create and modify food on that menu.

Background:
  Given the following restaurants exist:
    | name            | address                                       | phone_number  | description                               |
    | Nirchi's        | 3619 Vestal Parkway, Vestal, NY 13850         | 607-729-5131  | We serve pizza and italian cuisine        |
  
  Given the following foods exist:
    | name  | price | tags                        | rating  | number_of_ratings |
    | Pizza | 5     | italian;pizza;cheese;sauce  | 0       | 0                 |
  
  And I am on the login page
  And I am signed in with provider "GitHub"
  And I am on the restaurant listings page
  And I follow "More info for Nirchi's"

Scenario: Attempt to rate a food item without authorization
  When I press "Rate Food"
  Then I should see "You cannot rate your own food, sorry."

Scenario: Rate a food item
  Given I sign out
  And I am signed in with provider "Facebook"
  And I am on the restaurant listings page
  And I follow "More info for Nirchi's"
  
  When I press "Rate Food"
  And I select "4" from "Score"
  And I press "Submit Rating"
  Then I should see "You successfully gave 'Pizza' a rating of '4'"

# Scenario: Modify an existing food item
#   Given the following foods exist:
#     | name  | price | tags                        |
#     | Pizza | 5     | italian;pizza;cheese;sauce  |
  
#   And I am on the restaurant listings page
#   And I follow "More info for Nirchi's"
#   Then I should see "Menu" before "italian;pizza;cheese;sauce"
#   When I follow "Edit Food"
#   Then I should see "Edit Existing Food"
#   When I fill in "Name" with "Square Pizza"
#   And I fill in "Price" with "4"
#   And I fill in "Tags" with "italian;pizza;cheese;sauce;pan;square"
#   And I press "Update Food Info"
#   Then I should see "Square Pizza was successfully updated."
#   And I should see "Square Pizza" before "pan;square"

# Scenario: Delete an existing food item
#   Given the following foods exist:
#     | name  | price | tags                        |
#     | Pizza | 5     | italian;pizza;cheese;sauce  |
  
#   And I am on the restaurant listings page
#   And I follow "More info for Nirchi's"
#   When I press "Delete Food"
#   Then I should see "Food 'Pizza' deleted."
#   And I should not see "italian;pizza;cheese;sauce"

# Scenario: Attempt to modify an existing food item without authorization
#   Given the following foods exist:
#     | name  | price | tags                        |
#     | Pizza | 5     | italian;pizza;cheese;sauce  |
  
#   And I sign out
#   And I am signed in with provider "Facebook"
#   And I am on the restaurant listings page
#   And I follow "More info for Nirchi's"
#   When I follow "Edit Food"
#   Then I should see "You do not have permission to edit 'Pizza'"

# Scenario: Attempt to delete an existing food item without authorization
#   Given the following foods exist:
#     | name  | price | tags                        |
#     | Pizza | 5     | italian;pizza;cheese;sauce  |
  
#   And I sign out
#   And I am signed in with provider "Facebook"
#   And I am on the restaurant listings page
#   And I follow "More info for Nirchi's"
#   When I press "Delete Food"
#   Then I should see "You do not have permission to delete 'Pizza'"

# Scenario: Attempt to add a food item to a restaurant without authorization
#   Given I sign out
#   And I am signed in with provider "Facebook"
#   And I am on the restaurant listings page
#   And I follow "More info for Nirchi's"
#   When I press "Add New Food"
#   Then I should see "You do not have permission to add foods to 'Nirchi's'"
