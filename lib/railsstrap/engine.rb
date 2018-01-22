require 'rails'
require 'json'

require_relative '../../app/helpers/railsstrap/breadcrumbs.rb'
require_relative '../../app/helpers/railsstrap/breadcrumbs_helper.rb'
require_relative '../../app/helpers/railsstrap/modal_helper.rb'
require_relative '../../app/helpers/railsstrap/navbar_helper.rb'
require_relative '../../app/helpers/railsstrap/bootstrap_flash_helper.rb'
require_relative '../../app/helpers/railsstrap/form_errors_helper.rb'
require_relative '../../app/helpers/railsstrap/date_picker_helper.rb'

module Railsstrap
  class Engine < ::Rails::Engine

    initializer 'railsstrap.setup',
                :after => 'railsstrap.before.load_config_initializers',
                :group => :all do |app|
      app.config.assets.paths << File.join(config.root, 'vendor', 'assets', 'javascripts')
      app.config.assets.paths << File.join(config.root, 'vendor', 'assets', 'stylesheets')
      app.config.assets.paths << File.join(config.root, 'node_modules', '@fortawesome', 'fontawesome')
      app.config.assets.paths << File.join(config.root, 'node_modules', '@fortawesome', 'fontawesome-free-regular')
      app.config.assets.paths << File.join(config.root, 'node_modules', '@fortawesome', 'fontawesome-free-solid')
      app.config.assets.paths << File.join(config.root, 'node_modules', '@fortawesome', 'fontawesome-free-brands')
      app.config.assets.paths << File.join(config.root, 'node_modules', 'bootstrap', 'scss')
    end

    initializer 'railsstrap.setup_helpers' do |app|
      app.config.to_prepare do
        ActionController::Base.send :include, Railsstrap::Breadcrumbs
      end

      [Railsstrap::AsideHelper,
       Railsstrap::BadgeLabelHelper,
       Railsstrap::BootstrapFlashHelper,
       Railsstrap::FormErrorsHelper,
       Railsstrap::ModalHelper,
       Railsstrap::IconHelper,
       Railsstrap::NavbarHelper,
       Railsstrap::DatePickerHelper].each do |h|
        app.config.to_prepare do
          ActionController::Base.send :helper, h
        end
      end

      ActionView::Helpers::FormBuilder.send :include, Railsstrap::FormErrorsHelper
    end
  end
end
