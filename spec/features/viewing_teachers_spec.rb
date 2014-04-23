require 'spec_helper'

feature 'Viewing Teacher Pages' do
  let!(:teacher1) { FactoryGirl.create(:teacher, name: 'Albus Dumbledore') }
  let!(:teacher2) { FactoryGirl.create(:teacher, name: 'Minerva McGonagal') }

  scenario 'listing all teachers' do
    visit teachers_path

    expect(page).to have_title 'TWG | Our teachers'
    expect(page).to have_content 'Waldorfgümnaasium teachers & staff'
    expect(page).to have_content teacher1.name
    expect(page).to have_content teacher1.email
    expect(page).to have_content teacher1.subjects
    expect(page).to have_content teacher2.name
    expect(page).to have_content teacher2.email
    expect(page).to have_content teacher2.subjects
  end

  scenario 'viewing a single teacher' do
    visit teachers_path
    click_link teacher1.name

    expect(page).to have_title "TWG | #{teacher1.name}"
    expect(page).to have_content teacher1.name
    expect(page).to have_content teacher1.email
    expect(page).to have_content teacher1.subjects
    expect(page).to have_content teacher1.bio

    expect(page).to have_link('All teachers', href: teachers_path)
  end
end