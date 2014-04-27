require 'spec_helper'

feature 'Creating Teachers' do
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario 'before signing in' do
    visit new_teacher_path

    expect(page).to have_title 'TWG | Sign in'
    expect(page).to have_selector 'div.alert-box.warning', text: 'You must sign in.'
  end

  scenario 'valid teacher profile created by signed-in admin' do
    sign_in_as admin

    visit teachers_path
    click_link 'Create new teacher profile'
    fill_in 'teacher_name', with: 'Severus Snape'
    fill_in 'teacher_email', with: 'snape@waldorf.info'
    fill_in 'teacher_subjects', with: 'Potions'
    fill_in 'teacher_bio', with: 'There will be no wand-waving!'
    click_button 'Create Teacher'

    expect(page).to have_title 'Severus Snape'
    expect(page).to have_selector 'div.alert-box.success', text: 'New teacher created.'

    visit teachers_path
    expect(page).to have_content 'Severus Snape'
  end

  scenario 'invalid teacher profile created by signed-in admin' do
    sign_in_as admin

    visit new_teacher_path
    click_button 'Create Teacher'

    expect(page).to have_title 'New Teacher'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end

  scenario 'valid teacher profile with attached image created by a signed-in admin' do
    sign_in_as admin
    visit new_teacher_path
    add_valid_teacher_info
    attach_file 'Photo', Rails.root.join('spec/fixtures/rails.png')
    click_button 'Create Teacher'

    expect(page).to have_selector 'div.alert-box.success', text: 'New teacher created.'
    expect(page).to have_css("img[src*='rails.png']")
  end

  scenario 'valid teacher profile with attached non-image file created by a signed-in admin' do
    sign_in_as admin
    visit new_teacher_path
    add_valid_teacher_info
    attach_file 'Photo', Rails.root.join('spec/fixtures/rails.txt')
    click_button 'Create Teacher'

    expect(page).to have_title 'TWG | New Teacher'
    expect(page).to have_selector 'div.form-errors', text: 'prevented this form from being submitted'
  end
end

def add_valid_teacher_info
  fill_in 'teacher_name', with: 'Severus Snape'
  fill_in 'teacher_email', with: 'snape@waldorf.info'
  fill_in 'teacher_subjects', with: 'Potions'
  fill_in 'teacher_bio', with: 'There will be no wand-waving!'
end