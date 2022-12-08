require 'faker'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'
require_relative '../app/models/payment_source'
require_relative '../app/services/v1/users/create_service'
require_relative '../app/services/v1/users/create_payment_source_service'
require_relative '../app/services/v1/drivers/create_service'

puts '>>> Start Seed <<<'

puts '  Create users'
users = (1..3).map do | _ |
  user = V1::Users::CreateService.call(Faker::Name.name, Faker::Internet.email,
    Faker::Alphanumeric.alpha(number: 10))
  puts "    -> user: #{user.name} was create 👤"

  user
end

puts '  Create payments sources'
users.map do | user |
  acceptance_token = Wompi.presigned_acceptance['acceptance_token']
  credit_card = { number: '4242424242424242', expiration_date: '2025/08', cvc: 777,
    card_holder: 'APPROVED'}

  payment_source = V1::Users::CreatePaymentSourceService.call(user, acceptance_token, :card,
    credit_card)
  puts "    -> payment_source: #{payment_source.name} - #{payment_source.token_id} - #{payment_source.kind}_#{payment_source.wompi_payment_source_id}"
end

puts '  Create drivers'
drivers = (1..3).map do | _ |
  driver = V1::Drivers::CreateService.call(Faker::Name.name, Faker::Alphanumeric.alpha(number: 6),
    Faker::Alphanumeric.alpha(number: 10))
  puts "    -> driver: #{driver.name} - was create 🚗"

  driver
end

puts '>>> End Seed <<<'
