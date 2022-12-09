WompiSetting.configure do |config|
  config.url = ENV['WOMPI_URL']
  config.public_key = ENV['WOMPI_PUB_KEY']
  config.private_key = ENV['WOMPI_PRV_KEY']
end
