require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class AlertBox < Base
      # @return [#to_s] the content-related class to assign to the alert box.
      def variant_class
        AlertBox.variants[@options.fetch :variant, @options[:variant]]
      end

      # @return [#to_s] the HTML to show a dismissible button for the alert box.
      def dismissible_button
        if @options[:dismissible] || @options[:variant]
          path = '../../views/railsstrap/_alert_dismiss_button.html'
          File.read File.expand_path(path, __FILE__)
        end
      end


      # @return [Hash<Symbol, String>] the class that Bootstrap requires to
      #   append to an alert box based on its  variant. Using the SASS mixin
      #   alert-variant is supported, but you must set Railsstrap::Base::ALERT_TYPES
      #   to include your custom variant names.
      private_class_method

      def self.variants
        HashWithIndifferentAccess.new(:'alert-info').tap do |klass|
          VARIANT_TYPES.each do |variant|
            klass[variant.to_sym] = :"alert-#{variant}"
          end
        end
      end
    end
  end
end