@omniauth_test
Feature: test creation and modification of a restaurant
 
    As a user,
    So that I can have ownership of a restaurant,
    I want the ability to create and modify a restaurant listing.

Background:
  Given I am on the login page
  And I am signed in with provider "GitHub"
  And I am on the restaurant listings page
  
Scenario: Create a new restaurant
  When I follow "New Restaurant"
  And I fill in "Name" with "Lost Dog Cafe"
  And I fill in "Address" with "222 Water Street, Binghamton, NY 13901"
  And I fill in "Phone Number" with "607-771-6063"
  And I fill in "Description" with "Serves lunch, dinner, coffee and drinks"
  And I press "Save Changes"
  Then I should see "Lost Dog Cafe was successfully created."
  And I should see "Details about Lost Dog Cafe"

Scenario: Modify an existing restaurant
  Given the following restaurants exist:
  | name            | address                                       | phone_number  | description                               |
  | Lost Dog Cafe   | 222 Water Street, Binghamton, NY 13901        | 607-771-6063  | Serves lunch, dinner, coffee and drinks   |
  
  And I am on the restaurant listings page
  Then I should see "Lost Dog Cafe"
  When I follow "More info for Lost Dog Cafe"
  And I follow "Edit"
  And I fill in "Name" with "Nirchi's"
  And I fill in "Address" with "222 Water Street, Binghamton, NY 13901"
  And I fill in "Phone Number" with "607-771-6063"
  And I fill in "Description" with "We serve pizza and italian cuisine"
  And I press "Update Restaurant Info"
  Then I should see "Nirchi's was successfully updated."
  And I should see "We serve pizza and italian cuisine"

Scenario: Delete an existing restaurant
  Given the following restaurants exist:
  | name            | address                                       | phone_number  | description                               |
  | Lost Dog Cafe   | 222 Water Street, Binghamton, NY 13901        | 607-771-6063  | Serves lunch, dinner, coffee and drinks   |
  
  And I am on the restaurant listings page
  Then I should see "Lost Dog Cafe"
  When I follow "More info for Lost Dog Cafe"
  When I press "Delete"
  Then I should see "Restaurant 'Lost Dog Cafe' deleted."
  And I should not see "Serves lunch, dinner, coffee and drinks"

Scenario: Attempt to modify a restaurant without authorization
  Given the following restaurants exist:
  | name            | address                                       | phone_number  | description                               |
  | Lost Dog Cafe   | 222 Water Street, Binghamton, NY 13901        | 607-771-6063  | Serves lunch, dinner, coffee and drinks   |
  
  And I sign out
  And I am signed in with provider "Facebook"
  And I am on the restaurant listings page
  Then I should see "Lost Dog Cafe"
  When I follow "More info for Lost Dog Cafe"
  And I follow "Edit"
  Then I should see "You do not have permission to modify Lost Dog Cafe"

Scenario: Attempt to delete a restaurant without authorization
  Given the following restaurants exist:
  | name            | address                                       | phone_number  | description                               |
  | Lost Dog Cafe   | 222 Water Street, Binghamton, NY 13901        | 607-771-6063  | Serves lunch, dinner, coffee and drinks   |
  
  And I sign out
  And I am signed in with provider "Facebook"
  And I am on the restaurant listings page
  Then I should see "Lost Dog Cafe"
  When I follow "More info for Lost Dog Cafe"
  And I press "Delete"
  Then I should see "You do not have permission to delete Lost Dog Cafe"
