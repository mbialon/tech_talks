Given /^I am signed in as "([^"]*)" with "([^"]*)"$/ do |email, password|
  user = User.new(:email => email,
                  :password => password,
                  :password_confirmation => password)
  user.save!
  visit new_user_session_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  click_button("Sign in")
end
