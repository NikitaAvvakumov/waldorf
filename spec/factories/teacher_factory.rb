FactoryGirl.define do
  sequence(:email) { |n| "teacher#{n}@example.com"}

  factory :teacher do
    name 'Professor Dumbledore'
    email { generate :email }
    subjects 'Transformation, Conjuration'
    bio 'Widely considered the greatest wizard of his time, Prof. Dumbledore has been the Headmaster
of our school for nearly 40 years.'
  end
end