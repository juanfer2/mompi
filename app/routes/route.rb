before { content_type :json }

current_dir = Dir.pwd
puts current_dir
Dir["#{current_dir}/app/controllers/*.rb"].each { |file| require file }
