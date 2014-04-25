module AuthenticationHelpers

  def sign_in_as(admin)
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end