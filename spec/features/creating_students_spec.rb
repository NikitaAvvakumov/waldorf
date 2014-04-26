require 'spec_helper'

feature 'Creating Students' do
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario 'before signing in' do
    visit new_student_path

    expect(page).to have_title 'TWG | Sign in'
    expect(page).to have_selector 'div.alert-box.warning', text: 'You must sign in.'
  end

  scenario 'valid student profile created by signed-in admin' do
    sign_in_as admin

    visit students_path
    click_link 'Create new student profile'
    fill_in 'student_name', with: 'Ron Weasley'
    fill_in 'student_grade', with: 2
    fill_in 'student_about', with: "Ron's red hair---MORE--- is visible from anywhere."
    click_button 'Create Profile'

    expect(page).to have_title 'Ron Weasley'
    expect(page).to have_selector 'div.alert-box.success', text: 'New student profile created.'
    expect(page).to have_content "Ron's red hair is visible from anywhere."

    visit students_path
    expect(page).to have_content "Ron's red hair"
  end

  scenario 'invalid student profile created by a signed-in admin' do
    sign_in_as admin
    visit new_student_path
    click_button 'Create Profile'

    expect(page).to have_title 'TWG | New Student Profile'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end

  scenario 'valid student profile with attached image created by a signed-in admin' do
    sign_in_as admin
    visit new_student_path
    add_valid_student_info
    attach_file 'Photo', Rails.root.join('spec/fixtures/rails.png')
    click_button 'Create Profile'

    expect(page).to have_selector 'div.alert-box.success', text: 'New student profile created.'
    expect(page).to have_css("img[src*='rails.png']")
  end

  scenario 'valid student profile with attached non-image file created by a signed-in admin' do
    sign_in_as admin
    visit new_student_path
    add_valid_student_info
    attach_file 'Photo', Rails.root.join('spec/fixtures/rails.txt')
    click_button 'Create Profile'

    expect(page).to have_title 'TWG | New Student Profile'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end
end

def add_valid_student_info
  fill_in 'student_name', with: 'Ron Weasley'
  fill_in 'student_grade', with: 2
  fill_in 'student_about', with: "Ron's red hair---MORE--- is visible from anywhere."
end