require 'railsstrap/core_ext/rails/form_for_helper'

module Railsstrap
  module Extensions
    # Makes Bootstrap helpers available in Rails applications.
    #
    # To use Railsstrap in a Rails app you need 1 step:
    #
    #   - include railsstrap in the Gemfile
    #
    # The current class is loaded during the initialization process, so
    # there is no need to manually require any other file.
    class Railtie < ::Rails::Railtie
      initializer 'railsstrap.add_helpers' do
        ActionView::Base.send :include, Railsstrap::Helpers
        ActionView::Base.send :include, Railsstrap::Rails::Helpers
      end

      initializer 'railsstrap.add_views' do |app|
        views_path = File.expand_path '../../views', __FILE__
        ActionController::Base.prepend_view_path views_path
      end

      initializer 'railsstrap.setup',
                  :after => 'railsstrap.before.load_config_initializers',
                  :group => :all do |app|
        bowerrc = File.read(File.join(config.root, '.bowerrc'))
        app.config.less.paths << File.join(bowerrc['directory'])
        app.config.assets.paths << File.join(bowerrc['directory'])
        app.config.app_generators.stylesheet_engine :less
      end

    end
  end

  Railsstrap.framework = :rails
end