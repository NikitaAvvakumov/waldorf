FactoryGirl.define do

  factory :admin do
    email 'admin@waldorf.info'
    password 'tartuwaldorf'
    password_confirmation 'tartuwaldorf'
  end
end