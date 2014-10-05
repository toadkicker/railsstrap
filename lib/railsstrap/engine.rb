require 'rails'
require 'json'

require_relative '../../app/helpers/railsstrap/breadcrumbs.rb'
require_relative '../../app/helpers/railsstrap/breadcrumbs_helper.rb'
require_relative '../../app/helpers/railsstrap/modal_helper.rb'
require_relative '../../app/helpers/railsstrap/navbar_helper.rb'
require_relative '../../app/helpers/railsstrap/bootstrap_flash_helper.rb'
require_relative '../../app/helpers/railsstrap/form_errors_helper.rb'

module Railsstrap
  class Engine < ::Rails::Engine

    initializer 'railsstrap.setup',
      :group => :all do |app|
          bowerrc = File.read(File.join(config.root, '.bowerrc'))
          app.config.assets.paths << File.join(bowerrc['directory'])
        end

    initializer 'railsstrap.setup_helpers' do |app|
      app.config.to_prepare do
        ActionController::Base.send :include, Railsstrap::Breadcrumbs
      end

      [Railsstrap::BootstrapFlashHelper,
       Railsstrap::FormErrorsHelper,
       Railsstrap::ModalHelper,
       Railsstrap::GlyphHelper,
       Railsstrap::IconHelper,
       Railsstrap::NavbarHelper,
       Railsstrap::BadgeLabelHelper].each do |h|
        app.config.to_prepare do
          ActionController::Base.send :helper, h
        end
      end
      ActionView::Helpers::FormBuilder.send :include, Railsstrap::FormErrorsHelper
    end
  end
end
