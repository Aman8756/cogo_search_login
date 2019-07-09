require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CogoSearch
  class Application < Rails::Application

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', headers: :any, methods: :any
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.api_only = true

    config.generators do |g|
      g.test_framework  nil
      g.view_specs      false
      g.helper_specs    false
      g.orm :active_record, primary_key_type: :uuid
    end

    config.active_job.queue_adapter = :sidekiq


    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

  end
end
