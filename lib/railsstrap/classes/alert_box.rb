require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class AlertBox < Base
      # @return [#to_s] the content-related class to assign to the alert box.
      def variant_class
        AlertBox.variants[@options.fetch :variant, @options[:priority]]
      end

      # @return [#to_s] the HTML to show a dismissible button for the alert box.
      def dismissible_button
        if @options[:dismissible] || @options[:priority]
          path = '../../views/railsstrap/_dismiss_button.html'
          File.read File.expand_path(path, __FILE__)
        end
      end

    private

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
    end
  end
end