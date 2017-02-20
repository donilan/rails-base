require_relative 'boot'
require 'yaml'

env_file = File.expand_path("../local_env.yml", __FILE__)
raise "Missing local_env.yml file, please copy it from sample!" unless File.exists?(env_file)
YAML.load(File.open(env_file)).each do |key, value|
  ENV[key.to_s] ||= value.to_s
end

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AccountablyWeb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << Rails.root.join('lib')

    # I18n.default_locale = :'us'
    # config.time_zone = ''

    # exception notification
    if ENV['NOTIFICATION_EMAIL_PREFIX'] && ENV['NOTIFICATION_EMAIL_SENDER'] && ENV['NOTIFICATION_EMAIL_RECIPIENTS']
      config.middleware.use ExceptionNotification::Rack,
                            :email => {
                              :email_prefix => ENV['NOTIFICATION_EMAIL_PREFIX'],
                              :sender_address => ENV['NOTIFICATION_EMAIL_SENDER'],
                              :exception_recipients => ENV['NOTIFICATION_EMAIL_RECIPIENTS'].split(",")
                            }
    end

    # default host
    if ENV['HOST']
      config.action_mailer.default_url_options = { host: ENV['HOST'] }
      config.action_mailer.default_url_options.merge!(port: ENV['PORT']) if ENV['PORT']
    end

    # email
    if ENV["SMTP_HOST"] && ENV["SMTP_USERNAME"] && ENV["SMTP_PASSWORD"] && ENV["SMTP_PORT"]
      ActionMailer::Base.smtp_settings = {
        :address => ENV["SMTP_HOST"],
        :user_name => ENV["SMTP_USERNAME"],
        :password => ENV["SMTP_PASSWORD"],
        :port => ENV["SMTP_PORT"] && ENV["SMTP_PORT"].to_i,
        :domain => ENV["SMTP_DOMAIN"],
        :authentication => ENV['SMTP_AUTHENTICATION'] && ENV['SMTP_AUTHENTICATION'].to_sym,
        :ssl => true,
        :enable_starttls_auto => true,
      }
    end
  end
end
