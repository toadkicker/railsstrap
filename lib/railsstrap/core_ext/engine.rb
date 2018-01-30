require 'rails'
require 'json'

require 'railsstrap/helpers/alert_box_helper'
require 'railsstrap/helpers/aside_helper'
require 'railsstrap/helpers/badge_helper'
require 'railsstrap/helpers/breadcrumbs'
require 'railsstrap/helpers/breadcrumbs_helper'
require 'railsstrap/helpers/button_group_helper'
require 'railsstrap/helpers/button_helper'
require 'railsstrap/helpers/button_to_helper'
require 'railsstrap/helpers/card_group_helper'
require 'railsstrap/helpers/card_helper'
require 'railsstrap/helpers/date_picker_helper'
require 'railsstrap/helpers/dropdown_helper'
require 'railsstrap/helpers/flash_helper'
require 'railsstrap/helpers/form_errors'
require 'railsstrap/helpers/glyphicon_helper'
require 'railsstrap/helpers/horizontal_helper'
require 'railsstrap/helpers/icon_helper'
require 'railsstrap/helpers/link_to_helper'
require 'railsstrap/helpers/modal_helper'
require 'railsstrap/helpers/nav_helper'
require 'railsstrap/helpers/navbar_helper'
require 'railsstrap/helpers/progress_bar_helper'
require 'railsstrap/helpers/vertical_helper'
require 'railsstrap/core_ext/rails/form_for_helper'
require 'railsstrap/core_ext/rails/form_builder'

module Railsstrap
  class Engine < ::Rails::Engine

    initializer 'railsstrap.setup',
                after: 'rails.before.load_config_initializers',
                group: :all do |app|
      fallback = app.config.generators.options[:rails][:template_engine]
      app.config.app_generators.stylesheet_engine :sass
      app.config.generators.template_engine :railsstrap
      app.config.generators.template_extension fallback || :erb
      app.config.generators.fallback[:railsstrap] = fallback
    end

    initializer 'railsstrap.assets' do |app|
      %w(stylesheets javascripts).each do |sub|
        app.config.assets.paths << File.join('vendor', sub)
      end
    end

    initializer 'railsstrap.setup_helpers' do |app|
      app.config.to_prepare do
        ActionController::Base.send :include, Railsstrap::Breadcrumbs
      end

      app.config.to_prepare do
        ActionController::Base.send :helper, Railsstrap::Helpers
      end

      ActionView::Helpers::FormBuilder.send :include, Railsstrap::Rails::Helpers
    end
  end
end
