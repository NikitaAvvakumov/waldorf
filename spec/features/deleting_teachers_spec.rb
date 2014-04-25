require 'spec_helper'

feature 'Deleting Teachers' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:teacher) { FactoryGirl.create(:teacher) }

  scenario 'deleting a teacher as a signed-in admin' do
    sign_in_as admin

    visit teachers_path
    click_link teacher.name
    click_link 'Delete'

    expect(page).to have_title 'TWG | Teachers'
    expect(page).to have_selector 'div.alert-box.success', text: 'Teacher profile has been deleted.'
  end
end