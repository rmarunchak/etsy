require_relative '../support/env'

Before do |scenario|
  log = Logger.new(STDOUT)
  location = scenario.location
  string = File.read(location.file)
  document = ::Gherkin::Parser.new.parse(string)
  feature_name = document.feature.name
  log.info("#{feature_name}")
  scenario_name = scenario.name
  log.info("#{scenario_name}")
end
