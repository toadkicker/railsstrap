require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Navbar < Base
      # @return [#to_s] the style-related class to assign to the navbar.
      def variant_class
        Navbar.variants[@options[:variant]]
      end

      # @return [#to_s] the style-related class to assign to the navbar.
      def text_variant_class
        Navbar.text_variants[@options[:text_variant]]
      end

      # @return [#to_s] the position-related class to assign to the navbar.
      def position_class
        Navbar.positions[@options[:position]]
      end

      # @return [#to_s] the layout-related class to assign to the navbar.
      def layout_class
        Navbar.layouts[@options[:fluid]]
      end

      def id
        @id ||= @options.fetch :id, "navbar-collapse-#{rand 10**10}"
      end

    private

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to navbars to specify a color combination.
      def self.variants
        HashWithIndifferentAccess.new(:'bg-primary').tap do |klass|
          variant_types.each do |v|
            klass[v] = :"bg-#{v}"
          end
          klass[:none] = ""
        end
      end

      def self.text_variants
        HashWithIndifferentAccess.new(:'navbar-dark').tap do |klass|
          klass[:dark] = :'navbar-dark'
          klass[:light] = :'navbar-light'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to navbars to set a specific DOM position.
      def self.positions
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:sticky]        = :'sticky-top'
          klass[:static_top]    = :'static-top'
          klass[:top]           = :'fixed-top'
          klass[:fixed_top]     = :'fixed-top'
          klass[:bottom]        = :'fixed-bottom'
          klass[:fixed_bottom]  = :'fixed-bottom'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to the navbar container for each possible layout.
      def self.layouts
        HashWithIndifferentAccess.new(:'container').tap do |klass|
          klass[true] = :'container-fluid'
        end
      end

    end
  end
end