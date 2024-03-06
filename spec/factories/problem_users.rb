FactoryBot.define do
  factory :problem_user do
    association :user
    association :problem
  end
end