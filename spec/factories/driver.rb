FactoryBot.define do
  factory :driver do
    name { Faker::Name.name }
    number_plate { Faker::Alphanumeric.alpha(number: 6) }
    token { Faker::Alphanumeric.alpha(number: 10) }
    password { Faker::Alphanumeric.alpha(number: 10) }
  end
end
