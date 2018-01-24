require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "action_controller/railtie"
require "action_view/railtie"

require 'railsstrap'

module TestRails
  class Application < Rails::Application
  end
end