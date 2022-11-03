require_relative '../support/env'

def retrieve_credentials
  file = File.open('features/support/credentials.json', 'r+')
  JSON(file.read)
end

