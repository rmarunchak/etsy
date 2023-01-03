# frozen_string_literal: true
require 'faker'

module Generator
  module Payload
    class ProductPayload
      $credentials = Support::Helpers.new.retrieve_credentials

      def random_data
        payload = {
          "key": $credentials[0]['key'],
          "secret": $credentials[0]['secret'],
          "name": Faker::Mountain.name,
          "success_url": "https://staging.elopage.com",
          "cancel_url": "https://staging.elopage.com",
          "error_url": "https://staging.elopage.com",
          "webhook_url": "https://staging.elopage.com",
          "pricing_plans": [
            {
              "form": "one_time",
              "prefs": {
                "price": "199.9",
                "old_price": "300.0"
              }
            }
          ],
          "authors": [
            {
              "id": 4,
              "custom_commission_enabled": true,
              "commission": 10
            }
          ]
        }
        payload.to_json
      end
    end
  end
end
