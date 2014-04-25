require 'spec_helper'

feature 'Deleting Students' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:student) { FactoryGirl.create(:student) }

  scenario 'deleting a student as a signed-in admin' do
    sign_in_as admin

    visit students_path
    click_link student.name
    click_link 'Delete'

    expect(page).to have_title 'TWG | Students'
    expect(page).to have_selector 'div.alert-box.success', text: 'Student profile has been deleted.'
  end
end