require 'railsstrap/classes/cdn'

module Railsstrap
  module Helpers
    # @see http://www.bootstrapcdn.com
    # @return [String] the URL of the Bootstrap CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Bootstrap.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def bootstrap_css(options = {})
      Railsstrap::Cdn.bootstrap options.merge(name: 'bootstrap', extension: 'css')
    end

    # @see http://www.bootstrapcdn.com
    # @return [String] the URL of the Bootstrap Theme CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Bootstrap.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def bootstrap_theme_css(options = {})
      Railsstrap::Cdn.bootstrap options.merge(name: 'bootstrap-theme', extension: 'css')
    end

    # @see http://www.bootstrapcdn.com
    # @return [String] the URL of the Font Awesome CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Font Awesome.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    # @see http://fontawesome.io/get-started/
    def font_awesome_css(options = {})
      Railsstrap::Cdn.font_awesome options.merge(name: 'font-awesome', extension: 'css')
    end

    # @see http://www.bootstrapcdn.com
    # @return [String] the URL of the Bootstrap JS file
    # @param [Hash] options the options for which JS file to retrieve.
    # @option options [String] :version the version of Bootstrap.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def bootstrap_js(options = {})
      Railsstrap::Cdn.bootstrap options.merge(name: 'bootstrap', extension: 'js')
    end

    # @see http://www.railsstrap.io
    # @return [String] the URL of the Railsstrap CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Railsstrap.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def railsstrap_css(options = {})
      Railsstrap::Cdn.railsstrap options.merge(name: 'railsstrap', extension: 'css')
    end

    # @see http://www.railsstrap.io
    # @return [String] the URL of the Bootstrap Additions CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Bootstrap Additions.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def bootstrap_addtions_css(options = {})
      Railsstrap::Cdn.bootstrap_additions options.merge(name: 'bootstrap_additions', extension: 'css')
    end

    # @see http://www.railsstrap.io
    # @return [String] the URL of the Datepicker CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Bootstrap Additions.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def date_picker(options = {})
      Railsstrap::Cdn.date_picker options.merge(name: 'date_picker', extension: 'css')
    end
  end
end