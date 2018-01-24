require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Badge < Base
      # @return [#to_s] the content-related class to assign to the badge box.
      def variant_class
        Badge.variants[@options.fetch :variant, @options[:priority]]
      end

      # @return [#to_s] the HTML to show a dismissible button for the badge box.
      def dismissible_button
        if @options[:dismissible] || @options[:priority]
          path = '../../views/railsstrap/_badge_dismiss_button.html'
          File.read File.expand_path(path, __FILE__)
        end
      end

      def render_tag
        if @options[:href]
          render content_tag(:a)
        else
          render content_tag(:span)
        end
      end

      # @return [Hash<Symbol, String>] the class that Bootstrap requires to
      #   append to an badge box based on its variant.
      private_class_method
      def self.variants
        HashWithIndifferentAccess.new(:'badge-info').tap do |klass|
          variant_types.each do |variant|
            klass[variant.to_sym] = :"badge-#{variant}"
          end
          #Aliases
          klass[:notice] = :'badge-success'
          klass[:badge]  = :'badge-danger'
        end
      end

      def pill_class
        'badge-pill' if @options[:pill]
      end
    end
  end
end