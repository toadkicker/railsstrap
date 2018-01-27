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

      # @private
      # The fixed navbar will overlay your other content, unless you add padding
      # to the top or bottom of the <body>. Try out your own values or use our
      # snippet below. Tip: By default, the navbar is 50px high.
      # @see http://getbootstrap.com/components/#navbar-fixed-top
      def body_padding_style
        if body_padding_amount && body_padding_type
          style = "padding-#{body_padding_type}: #{body_padding_amount}px"
          @app.content_tag :style, "body {#{style}}"
        end
      end

    private

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to navbars to specify a color combination.
      def self.variants
        HashWithIndifferentAccess.new(:'bg-primary').tap do |klass|
          variant_types.each do |v|
            klass[v] = :"bg-#{v}"
          end
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

      def body_padding_amount
        @options.fetch :padding, 70
      end

      def body_padding_type
        /navbar-fixed-(?<type>top|bottom)$/ =~ position_class
        type
      end
    end
  end
end