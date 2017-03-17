require_relative 'boot'

require 'yaml'
env_file = File.expand_path("../local_env.yml", __FILE__)
YAML.load(File.open(env_file)).each do |key, value|
  next if value.nil?
  next if value.is_a?(String) && value.strip! == ''
  ENV[key.to_s] ||= value.to_s
end if File.exists?(env_file)


require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    config.autoload_paths << Rails.root.join('lib/ext')
    config.eager_load_paths << Rails.root.join('lib/ext')
    config.i18n.default_locale = :'zh-CN'
    config.time_zone = 'Beijing'


    if Settings.notification.enabled
      config.middleware.use ExceptionNotification::Rack, email: Settings.notification.to_h.except(:enabled)
      puts "exception notification is enabled with config #{Settings.notification.to_h.inspect}"
    end

    # default host
    if Settings.host
      host, port = Settings.host.split(':')
      config.action_mailer.default_url_options = { host: host }
      config.action_mailer.default_url_options.merge!(port: port) if port
      puts "host is set to #{host} and port is #{port || 'NOT SET'}"
    end

    # email
    if Settings.smtp.enabled
      config.action_mailer.delivery_method
      config.action_mailer.smtp_settings = Settings.smtp.to_h.except(:enabled)
      puts "SMTP is enlabled with config: #{Settings.smtp.to_h}"
    end
  end
end
