require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])

Data-engineering::Application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.data-engineering.com' }
end
