module Products
  class CreditCard
    attr_accessor :name, :number, :expiration_date, :cvc, :card_holder

    def initialize(number:, expiration_date:, cvc:, card_holder:)
      @number = number
      @expiration_date = expiration_date
      @cvc = cvc
      @card_holder = card_holder
    end

    def exp_year
      @expiration_date_year ||= expiration_date_array[0]
    end

    def exp_month
      @expiration_date_month ||= expiration_date_array[1]
    end

    def cvc_valid?
      cvc.to_s =~ /^\d{1,4}$/
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
        number: @number,
        expiration_date: @expiration_date,
        cvc: @cvc,
        card_holder: @card_holder,
      }
    end

    private

    def expiration_date_array
      @expiration_date_array ||= expiration_date.split('/')
    end
  end
end
