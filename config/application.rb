require_relative 'boot'

require "rails/all"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

Bundler.require(*Rails.groups)

module EspacoAluno
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join('config','locales',
                                                 '**','*.yml')]
    config.i18n.default_locale = :'pt-BR'
    config.i18n.locale = :'pt-BR'
    config.time_zone = 'Brasilia'
  end
end
