require 'email_spec'
require 'coveralls'
Coveralls.wear!('rails')

RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
end
