Devise.setup do |config|
  config.mailer_sender = ENV.fetch("DEVISE_MAILER_SENDER", "no-reply@#{ENV.fetch('APP_HOST', 'example.com')}")

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 12..128
  config.email_regexp = URI::MailTo::EMAIL_REGEXP
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.timeout_in = 60.minutes
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :email
  config.maximum_attempts = 6
  config.last_attempt_warning = true
end

