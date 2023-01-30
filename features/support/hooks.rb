require_relative '../support/env'

Before do |scenario|
  log = Logger.new(STDOUT)
  location = scenario.location
  string = File.read(location.file)
  document = ::Gherkin::Parser.new.parse(string)
  feature_name = document.feature.name
  log.info("#{feature_name}")
  scenario_name = scenario.name
  scenario_line_number = scenario.location.lines[0].to_a.first
  log.info("#{scenario_line_number} #{scenario_name}")
end

# After do |scenario|
# if scenario.failed?
#   file_path = File.join(Dir.getwd, "/screenshots")
#  Dir.mkdir file_path unless Dir.exists? file_path
#   page.driver.browser.save_screenshot("#{file_path}/#{scenario.__id__}.png")
#  embed("#{file_path}/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
# end
# end
