FactoryBot.define do
  factory :rider do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    token { Faker::Alphanumeric.alpha(number: 10) }
    password { Faker::Alphanumeric.alpha(number: 10) }
  end
end
