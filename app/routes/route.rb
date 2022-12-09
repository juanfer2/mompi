before do
  @body = body_request
  content_type :json
end

def body_request
  JSON.parse(request.body.read)
rescue
  { }
end

current_dir = Dir.pwd
Dir["#{current_dir}/app/controllers/**/*.rb"].each { |file| require file }

get '' do
  halt 200, { message: 'hi' }.to_json
end
