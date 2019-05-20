@omniauth_test
Feature: test functionality of the restaurant page
 
    As a user,
    So that I can view information about a restaurant,
    I want a dedicated page for that restaurant

Background:
  Given the following restaurants exist:
  | name            | address                                       | phone_number  | description                               |
  | Nirchi's        | 3619 Vestal Parkway, Vestal, NY 13850         | 607-729-5131  | We serve pizza and italian cuisine        |
  | Number 5        | 33 South Washington St. Binghamton, NY 13903  | 607-723-0555  | Prime Steaks, Fresh Seafood Since 1978    |
  | Lost Dog Cafe   | 222 Water Street, Binghamton, NY 13901        | 607-771-6063  | Serves lunch, dinner, coffee and drinks   |

  And I am on the login page
  And I am signed in with provider "GitHub"
  And I am on the FindGoodFood home page
  
Scenario: Search results for Lost Dog Cafe
  When I fill in "search_bar" with "Lost Dog Cafe"
  And I select "Restaurant" from "search_type"
  When I press "Submit"
  Then I should be on the restaurant results page
  Then I should see "222 Water Street, Binghamton, NY 13901"
  Then I should not see "33 South Washington St. Binghamton, NY 13903"