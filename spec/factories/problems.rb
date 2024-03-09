FactoryBot.define do
  factory :problem do
    problem_title {Faker::Team.name}
    message {Faker::Lorem.sentence}
    standpoint_id { rand(2..5) }
  end
end