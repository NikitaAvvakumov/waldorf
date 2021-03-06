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

  scenario 'creating a student profile with attached profile photo' do
    sign_in_as admin
    visit new_student_path
    add_valid_student_info
    attach_file 'student_photo', Rails.root.join('spec/fixtures/rails.png')
    click_button 'Create Profile'

    expect(page).to have_selector 'div.alert-box.success', text: 'New student profile created.'
    expect(page).to have_css("img[src*='rails.png']")
  end

  scenario 'creating a student profile with a non-image file as profile photo' do
    sign_in_as admin
    visit new_student_path
    add_valid_student_info
    attach_file 'student_photo', Rails.root.join('spec/fixtures/rails.txt')
    click_button 'Create Profile'

    expect(page).to have_title 'TWG | New Student Profile'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end

  scenario 'creating a student profile with attached assets', js: true do
    sign_in_as admin
    visit new_student_path
    #add_valid_student_info - does not work as textarea is taken over by tinyMCE
    fill_in 'student_name', with: 'Ron Weasley'
    fill_in 'student_grade', with: 2
    page.execute_script('$(tinymce.editors[0].setContent("Ron\'s red hair---MORE--- is visible from anywhere."))')

    attach_file 'Example 1', Rails.root.join('spec/fixtures/health_potion.png')
    click_link 'Add another file'
    attach_file 'Example 2', Rails.root.join('spec/fixtures/magic_wand.jpg')
    click_button 'Create Profile'

    expect(page).to have_selector 'div.alert-box.success', text: 'New student profile created.'
    within('#creations') do
      expect(page).to have_css("img[src*='health_potion.png']")
      expect(page).to have_css("img[src*='magic_wand.jpg']")
    end
  end
end