before { content_type :json }

current_dir = Dir.pwd
Dir["#{current_dir}/controllers/*.rb"].each { |file| require file }
