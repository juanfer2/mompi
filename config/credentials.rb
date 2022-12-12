module Credentials
  class << self
    def self.read_rules
      YAML.load_file("#{Dir.pwd}/config/credentials.yml")
    end

    read_rules.each do |key, val|
      define_method key do
        val
      end
    end
  end
end
