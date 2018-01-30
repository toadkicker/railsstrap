require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class AlertBox < Base
      # @return [#to_s] the content-related class to assign to the alert box.
      def variant_class
        AlertBox.variants[@options.fetch :variant, @options[:priority]]
      end

      # @return [#to_s] the size-related class to assign to the button.
      def size_class
        AlertBox.sizes[@options[:size]]
      end

      # @return [#to_s] the layout-related class to assign to the button.
      def layout_class
        AlertBox.layouts[@options[:layout]]
      end

      # @return [Hash<Symbol, String>] the class that Bootstrap requires to
      #   append to an alert box based on its variant.

      def self.variants
        HashWithIndifferentAccess.new(:'alert-info').tap do |klass|
          variant_types.each do |variant|
            klass[variant.to_sym] = :"alert-#{variant}"
          end
          #Aliases
          klass[:notice] = :'alert-success'
          klass[:alert]  = :'alert-danger'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible size.

      def self.sizes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:large]       = :'alert-lg'
          klass[:lg]          = :'alert-lg'
          klass[:sm]          = :'alert-sm'
          klass[:small]       = :'alert-sm'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.

      def self.layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:top] = :'top'
          klass[:top_left] = :'top-left'
          klass[:top_right] = :'top-right'
          klass[:bottom] = :'bottom'
          klass[:bottom_right] = :'bottom-right'
          klass[:bottom_left] = :'bottom-left'
        end
      end
    end
  end
end