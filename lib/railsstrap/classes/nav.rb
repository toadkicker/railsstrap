require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    # @api private
    class Nav < Base
      # @return [#to_s] the style-related class to assign to the nav.
      def style_class
        Nav.styles[@options[:as]]
      end

      # @return [#to_s] the layout-related class to assign to the nav.
      def layout_class
        Nav.layouts[@options[:layout]]
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to navs for each possible style.
      private_class_method
      def self.styles
        HashWithIndifferentAccess.new(:'nav-tabs').tap do |klass|
          klass[:pills] = :'nav-pills'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.
      private_class_method
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