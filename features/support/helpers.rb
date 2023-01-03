# frozen_string_literal: true

require_relative '../support/env'

module Support
  class Helpers
    def retrieve_credentials
      file = File.open('features/support/credentials.json', 'r+')
      JSON(file.read)
    end
  end
end
