FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gender_id { rand(1..3) }
    age {rand(1..120) }
    occupation_id { rand(1..15) }
    family_id { rand(1..5) }
  end
end