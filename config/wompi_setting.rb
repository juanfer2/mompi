WompiSetting.configure do |config|
  config.url = Credentials.wompi['url']
  config.public_key = Credentials.wompi['pub_key']
  config.private_key = Credentials.wompi['prv_key']
end
