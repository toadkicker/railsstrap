require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    # @api private
    class Nav < Base
      # @return [#to_s] the style-related class to assign to the nav.
      # Navbar navs are automatically assigned :navbar
      def style_class
        return Nav.styles[:navbar] if Railsstrap::Stack.find(Railsstrap::Navbar)
        Nav.styles[@options[:as]]
      end

      # @return [#to_s] the layout-related class to assign to the nav.
      # Navbar navs inherit layout from navbar and cannot use layouts
      def layout_class
        return if Railsstrap::Stack.find(Railsstrap::Navbar)
        Nav.layouts[@options[:layout]]
      end

      # @return [#to_s] choose between using <nav>, <ol>, or <ul> tags
      def tag
        @options[:tag] || :nav
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to navs for each possible style.

      def self.styles
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:tabs] = :'nav-tabs'
          klass[:pills] = :'nav-pills'
          klass[:navbar] = :'navbar-nav'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.

      def self.layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:justified] = :'nav-justified'
          klass[:stacked]   = :'flex-column'
          klass[:center] = :'justify-content-center'
          klass[:right] = :'justify-content-end'
          klass[:fill] = :'nav-fill'
        end
      end
    end
  end
end