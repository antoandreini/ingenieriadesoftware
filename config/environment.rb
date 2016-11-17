# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:user_name => "gauchadas2016@gmail.com",
:password => "ingenieriadesoftware",
:authentication => :plain,
:enable_starttls_auto => true,
:openssl_verify_mode => 'none'
}
