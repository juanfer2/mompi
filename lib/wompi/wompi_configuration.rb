class WompiConfiguration
  attr_accessor :url, :public_key, :private_key

  def initialize
    @url = nil
    @public_key = nil
    @private_key = nil
  end
end
