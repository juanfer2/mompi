require 'faker'
require_relative '../config/credentials'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'

current_dir = Dir.pwd
Dir["#{current_dir}/app/models/**/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/services/**/*.rb"].each { |file| require file }

if ENV['APP_ENV'] != 'test'
  puts '>>> Start Seed <<<'

  puts '  Create riders'
  riders = (1..3).map do | i |
    rider = V1::Riders::CreateService.call(Faker::Name.name, "rider#{i}@mompi.co",
      123456)
    puts "    -> rider: #{rider.name} with token: #{rider.token} was create 👤"

    rider
  end

  puts '  Create payments sources'
  riders.map do | rider |
    acceptance_token = Wompi.presigned_acceptance['acceptance_token']
    credit_card = { number: '4242424242424242', expiration_date: '2025/08', cvc: 777,
      card_holder: 'APPROVED'}

    payment_source = V1::Riders::CreatePaymentSourceService.call(rider, acceptance_token, :card,
      credit_card)
    puts "    -> payment_source: #{payment_source.name} - #{payment_source.token_id} - #{payment_source.kind}_#{payment_source.resource_id}"
  end

  puts '  Create drivers'
  drivers = (1..3).map do | i |
    driver = V1::Drivers::CreateService.call(Faker::Name.name, "driver#{i}@mompi.co",
      123456)
    puts "    -> driver: #{driver.name} with token #{driver.token} - was create 🚗"

    driver
  end

  puts '>>> End Seed <<<'
end
