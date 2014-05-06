require 'spec_helper'

feature 'Deleting Assets' do

  scenario 'deleting assets from a student profile' do

    student = Student.create(name: 'Ron Weasley', age: 11, grade: 2, about: 'Another red-haired Weasley.')
    asset1 = Asset.create(asset_file_name: 'art_icon.png', asset_content_type: 'image/png', student_id: student.id)
    Asset.create(asset_file_name: 'health_potion.png', asset_content_type: 'image/png', student_id: student.id)

    sign_in_as FactoryGirl.create(:admin)
    visit edit_student_path(student)

    expect(page).to have_css("img[src*='art_icon.png']")
    expect(page).to have_css("img[src*='health_potion.png']")

    click_link "delete_#{asset1.asset_file_name}"

    expect(page).not_to have_css("img[src*='art_icon.png']")
    expect(page).to have_css("img[src*='health_potion.png']")
  end
end