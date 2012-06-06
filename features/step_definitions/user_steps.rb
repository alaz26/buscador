# HELPERS
def create_visitor
  @visitor ||= {:name => "nombre", :username => "username", :password => "segura", 
                :password_confirmation => "segura", :type => 3, :status => true}
end

def delete_user
    @user ||= User.first conditions: {:email => @visitor[:email]}
      @user.destroy unless @user.nil?
end

def find_user
    @user ||= User.first conditions: {:email => @visitor[:email]}
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Nombre", :with => @visitor[:name]
  fill_in "Username", :with => @visitor[:username]
  fill_in "Email", :with => @visitor[:email]
  select "Visitante", :from => "Tipo de Cuenta"
  fill_in "Contrasena", :with => @visitor[:password]
  fill_in "Confirmar Contrasena", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

# GIVEN
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor

end

Then /^I should see a successful sign up message$/ do
    page.should have_content "Welcome! You have signed up successfully."
end

