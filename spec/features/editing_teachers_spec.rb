require 'spec_helper'

feature 'Editing Teachers' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:teacher) { FactoryGirl.create(:teacher) }

  scenario 'before signing in' do
    visit edit_teacher_path(teacher)

    expect(page).to have_title 'TWG | Sign in'
    expect(page).to have_selector 'div.alert-box.warning', text: 'You must sign in.'
  end

  scenario 'valid teacher profile changes by signed-in admin' do
    sign_in_as admin

    visit teachers_path
    click_link teacher.name
    click_link 'Edit'

    fill_in 'teacher_name', with: 'Severus Snape'
    fill_in 'teacher_email', with: 'snape@waldorf.info'
    fill_in 'teacher_subjects', with: 'Potions'
    fill_in 'teacher_bio', with: 'There will be no silly wand waving in this class.'
    click_button 'Update Profile'

    expect(page).to have_title 'Severus Snape'
    expect(page).to have_selector 'div.alert-box.success', text: 'Teacher profile has been updated.'
  end

  scenario 'invalid student profile changes by signed-in admin' do
    sign_in_as admin

    visit edit_teacher_path(teacher)
    fill_in 'teacher_name', with: ''
    fill_in 'teacher_email', with: ''
    fill_in 'teacher_subjects', with: ''
    fill_in 'teacher_bio', with: ''
    click_button 'Update Profile'

    expect(page).to have_title 'TWG | Edit teacher profile'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end
end