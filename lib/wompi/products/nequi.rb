module Products
  class Nequi
    attr_accessor :phone_number

    def initialize(phone_number)
      @phone_number = phone_number
    end

    def to_data_json
      {
        phone_number: @phone_number
      }
    end
  end
end
