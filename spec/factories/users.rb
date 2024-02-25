FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gender_id { rand(2..3) }
    age {rand(2..120) }
    occupation_id { rand(2..15) }
    family_id { rand(2..5) }
  end
end