require 'railsstrap/classes/cdn'

module Railsstrap
  module Helpers
    # @see https://cdnjs.com/libraries/jquery/
    # @return [String] the URL of the jQuery JS file
    # @param [Hash] options the options for which JS file to retrieve.
    # @option options [String] :version the version of jQuery.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def jquery_js(options = {})
      Railsstrap::Cdn.jquery_js options.merge(name: 'jquery', extension: 'js')
    end

    # @see https://cdnjs.com/libraries/popper.js
    # @return [String] the URL of the Popper JS file
    # @param [Hash] options the options for which JS file to retrieve.
    # @option options [String] :version the version of Popper.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    def popper_js(options = {})
      Railsstrap::Cdn.popper_js options.merge(name: 'popper', extension: 'js')
    end

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

    # @see http://www.cdnjs.com
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
    # @return [String] the URL of the Font Awesome CSS file
    # @param [Hash] options the options for which CSS file to retrieve.
    # @option options [String] :version the version of Font Awesome. 5.0+ is required.
    # @option options [String] :scheme the URI scheme to use.
    # @option options [Boolean] :minified whether to use the minified version.
    # @see http://fontawesome.io/get-started/
    def font_awesome_js(options = {})
      Railsstrap::Cdn.font_awesome options.merge(
        name: 'font-awesome',
        extension: 'js'
      )
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

    # @see https://cdnjs.com/
    # @return [String] The URL of the library from CDN
    # @param [Hash] options the options for which JS file to retrieve.
    # @option options [String] :version the semver of the file
    # @option options [String] :extension .js or .css
    # @option options [Boolean] :minified whether to use the minified version.
    # @option options [String] :library the name of the library to retrieve
    # @option options [String] :scheme http/https (no colon)
    # @option options [String] :path @default 'ajax/libs' (no trailing slashes)
    # @option options [String] :host 'cdnjs.cloudflare.com'
    def cdn(options = {})
      content_tag :script, nil, src: Railsstrap::Cdn.cdn_asset(options)
    end

  end
end