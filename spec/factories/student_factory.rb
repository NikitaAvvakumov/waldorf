include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :student do
    name 'Harry Potter'
    age 11
    grade 2
    about 'Come on, you know...'
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/rails.png'), 'image/png') }
  end
end