require 'spec_helper'

feature 'Viewing Students' do
  let!(:student1) { FactoryGirl.create(:student, name: 'Harry Potter',
                                       about: 'Harry always finds trouble.---MORE--- Or perhaps trouble finds him.') }
  let!(:student2) { FactoryGirl.create(:student, name: 'Hermione Granger',
                                       about: 'Hermione knows everything.---MORE--- Because she has read every book.') }

  scenario 'listing all students' do
    visit students_path

    expect(page).to have_title 'TWG | Students'
    expect(page).to have_content 'Featured Waldorfgümnaasium students'
    expect(page).to have_content student1.name
    expect(page).to have_content student2.name

    expect(page).to have_content 'Harry always finds trouble.'
    expect(page).not_to have_content 'Or perhaps trouble finds him.'
    expect(page).to have_content 'Hermione knows everything.'
    expect(page).not_to have_content 'Because she has read every book.'
    expect(page).not_to have_content '---MORE---'
  end

  scenario 'viewing an individual student' do
    visit students_path
    click_link student1.name

    expect(page).to have_title "TWG | #{student1.name}"
    expect(page).to have_content student1.name
    expect(page).to have_content 'Harry always finds trouble. Or perhaps trouble finds him.'
    expect(page).not_to have_content '---MORE---'
  end
end