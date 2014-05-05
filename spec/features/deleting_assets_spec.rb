require 'spec_helper'

feature 'Deleting Assets' do

  scenario 'deleting assets from a student profile' do
    admin = FactoryGirl.create(:admin)
    student = Student.create(name: 'Ron Weasley', age: 11, grade: 2, about: 'Another red-haired Weasley.')
    asset1 = Asset.create(asset_file_name: 'art_icon.png', asset_content_type: 'image/png', student_id: student.id)
    asset2 = Asset.create(asset_file_name: 'health_potion.png', asset_content_type: 'image/png', student_id: student.id)

    sign_in_as admin
    visit student_path(student)

    expect(page).to have_css("img[src*='art_icon.png']")
    expect(page).to have_css("img[src*='health_potion.png']")

    click_link "delete_#{asset1.asset_file_name}"

    expect(page).not_to have_css("img[src*='art_icon.png']")
    expect(page).to have_css("img[src*='health_potion.png']")
  end
end