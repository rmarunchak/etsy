# frozen_string_literal: true

module Generator
  module Endpoint
    class ProductEndpoint
      PRODUCTS = 'https://api.staging.elopage.com/api/products'

      def new_product(payload)
        request = RestClient.post(PRODUCTS, payload)
        log = Logger.new(STDOUT)
        log.info(request.body)
      end
    end
  end
end
