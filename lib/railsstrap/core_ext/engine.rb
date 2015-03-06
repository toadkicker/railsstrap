require 'json'
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

    class Engine < ::Rails::Engine

      initializer 'railsstrap.add_helpers' do
        ActionView::Base.send :include, Railsstrap::Helpers
        ActionView::Base.send :include, Railsstrap::Rails::Helpers
      end

      initializer 'railsstrap.add_views' do |app|
        views_path = File.expand_path '../../views', __FILE__
        ActionController::Base.prepend_view_path views_path
      end

      # Include local asset files where .bowerrc defines them
      initializer 'railsstrap.setup',
                  :after => 'railsstrap.before.load_config_initializers',
                  :group => :all do |app|
        bowerrc = File.read(File.join(config.root, '.bowerrc'))
        app.config.assets.paths << File.join(bowerrc['directory'])
        app.config.less.paths << File.join(bowerrc['directory']) if defined?(app.config.less)
        app.config.generators.stylesheet_engine :less if ::Rails::VERSION::MAJOR <= 3.1
        app.config.app_generators.stylesheet_engine :less if ::Rails::VERSION::MAJOR >= 3.2
      end
    end
  end

  Railsstrap.framework = :rails
end
