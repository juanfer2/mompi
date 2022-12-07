module WompiSetting
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= WompiConfiguration.new
      yield(configuration)
    end

    def reset
      self.configuration = WompiConfiguration.new
    end
  end
end
