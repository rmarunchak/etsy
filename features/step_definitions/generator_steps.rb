# frozen_string_literal: true

And(/^I generate product$/) do
  payload = Generator::Payload::ProductPayload.new.random_data
  Generator::Endpoint::ProductEndpoint.new.new_product(payload)
end
