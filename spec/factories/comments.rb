FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.sentence}
    association :user
    association :problem

    after(:build) do |comment|
      comment.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end