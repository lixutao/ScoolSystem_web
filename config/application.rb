require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'
include Log4r
Bundler.require(*Rails.groups)

module Controller
  class Application < Rails::Application
    log4r_config= YAML.load_file(File.join(File.dirname(__FILE__),"log4r.yml"))
    YamlConfigurator.decode_yaml( log4r_config['log4r_config'] )
    config.logger = Log4r::Logger[Rails.env]
    config.active_record.raise_in_transactional_callbacks = true\

    config.i18n.load_path += Dir[Rails.root.join('config','locales','**','*.{rb,yml}')]
    config.i18n.default_locale = "zh"
    config.action_controller.permit_all_parameters = true
  end
end
