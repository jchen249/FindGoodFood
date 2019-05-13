Given /^I am signed in with provider "([^"]*)"$/ do |provider|
  if provider == "Facebook"
      step %{I follow "Register or Log In with Facebook"}
  else
      step %{I follow "Register or Log In with GitHub"}
  end
end

Given /^I sign out$/ do
  step %{I press "Profile Dashboard"}
  step %{I follow "Log Out"}
end