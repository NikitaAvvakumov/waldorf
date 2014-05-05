require 'spec_helper'

feature 'Displaying Assets' do

  scenario 'assets attached to new students are shown on home page' do
    student1 = Student.create(name: 'Ron Weasley', age: 11, grade: 2, about: 'Another red-haired Weasley.')
    Asset.create(asset_file_name: 'art_icon.png', asset_content_type: 'image/png', student_id: student1.id)
    student2 = Student.create(name: 'Harry Potter', age: 11, grade: 2, about: 'The boy with the lightning scar.')
    Asset.create(asset_file_name: 'health_potion.png', asset_content_type: 'image/png', student_id: student2.id)
    student3 = Student.create(name: 'Ginny Weasley', age: 9, grade: 1, about: 'The youngest Weasley.')
    Asset.create(asset_file_name: 'spell_symbol.png', asset_content_type: 'image/png', student_id: student3.id)

    visit root_path
    expect(page).to have_asset_carousel

    visit about_path
    expect(page).to have_asset_carousel
  end
end