module V1
  module Riders
    class CreatePaymentSourceService < ApplicationService
      def initialize(current_user, acceptance_token, kind, product)
        @current_user = current_user
        @acceptance_token = acceptance_token
        @kind = kind
        @product = product
      end

      def call
        PaymentSource.create(rider_id: @current_user.id, name: tokenization_product['name'],
          token_aceptation: @acceptance_token, token_id: tokenization_product['id'], kind: @kind,
          resource_id: wompi_payment_source['id'])
      end

      private

      def wompi_payment_source 
        Wompi.create_payment_source(@kind, tokenization_product['id'], @current_user.email,
          @acceptance_token)
      end

      def tokenization_product
        Wompi.tokenization_product(@kind.to_s, @product)['data']
      end
    end
  end
end
