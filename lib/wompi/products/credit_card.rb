module Products
  class CreditCard
    attr_accessor :name, :number, :expiration_date, :security_code, :owner_card, :document_id

    def initialize(name:, number:, expiration_date:, security_code:, owner_card:, document_id:)
      @name = name
      @number = number
      @expiration_date = expiration_date
      @security_code = security_code
      @owner_card = owner_card
      @document_id = document_id
    end

    def expiration_date_year
      @expiration_date_year ||= expiration_date_array[0]
    end

    def expiration_date_month
      @expiration_date_month ||= expiration_date_array[1]
    end

    def security_code_valid?
      security_code.to_s =~ /^\d{1,4}$/
    end

    def number_is_valid?
      number.to_s =~ /^\d{13,20}$/
    end

    def expiration_date_format_valid?
      expiration_date.to_s =~ /20[0-9]{2}\/(0[1-9]|10|11|12)$/
    end

    def credit_card_expired?
      expiration_date.to_date > Date.current
    end

    def to_data_json
      {
        name: @name,
        number: @number,
        expiration_date: @expiration_date,
        security_code: @security_code,
        owner_card: @owner_card,
        document_id: @document_id
      }
    end

    private

    def expiration_date_array
      @expiration_date_array ||= expiration_date.split('/')
    end
  end
end
