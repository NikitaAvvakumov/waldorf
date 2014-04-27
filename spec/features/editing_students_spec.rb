require 'spec_helper'

feature 'Editing Students' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:student) { FactoryGirl.create(:student) }

  scenario 'before signing in' do
    visit edit_student_path(student)

    expect(page).to have_title 'TWG | Sign in'
    expect(page).to have_selector 'div.alert-box.warning', text: 'You must sign in.'
  end

  scenario 'valid student profile changes by signed-in admin' do
    sign_in_as admin

    visit students_path
    click_link student.name
    click_link 'Edit'

    fill_in 'student_name', with: 'Ron Weasley'
    fill_in 'student_grade', with: 2
    fill_in 'student_about', with: "Ron's red hair---MORE--- is visible from anywhere."
    click_button 'Update Profile'

    expect(page).to have_title 'Ron Weasley'
    expect(page).to have_selector 'div.alert-box.success', text: 'Student profile has been updated.'
    expect(page).to have_content "Ron's red hair is visible from anywhere."
    expect(page).to have_css("img[src*='rails.png']")
  end

  scenario 'invalid student profile changes by signed-in admin' do
    sign_in_as admin

    visit edit_student_path(student)
    fill_in 'student_name', with: ''
    fill_in 'student_grade', with: ''
    fill_in 'student_about', with: ''
    click_button 'Update Profile'

    expect(page).to have_title 'TWG | Edit student profile'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end

  scenario 'removing student profile photo' do
    sign_in_as admin
    visit edit_student_path(student)
    click_link 'Remove profile photo'

    expect(page).to have_title "#{student.name}"
    expect(page).not_to have_css("img[src*='rails.png']") # Student's original profile photo from FactoryGirl
    expect(page).to have_css("img[src*='wiz_hat.png']") # Paperclip default photo
    expect(page).to have_selector 'div.alert-box.success', text: 'Student profile photo has been removed.'
  end
end