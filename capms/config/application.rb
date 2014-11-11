require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'yaml'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Capms
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.initialize_on_precompile = false
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'
    config.assets.enabled = true
    config.assets.digest = true
    p "!" * 100
    p "about to try to connect to aws"

    p s3= AWS::S3.new(:s3_host_name=> 's3-us-west-2.amazonaws.com', :access_key_id=> ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
    # p AWS::S3::Base.establish_connection!(
    #   :access_key_id     => 'AKIAIJJTZJ4ACF4AHQCQ',
    #   :secret_access_key => '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'
    # )

    # p AWS::S3::Service.buckets
    # # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
