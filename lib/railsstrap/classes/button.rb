require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Button < Base
      # @return [#to_s] the variant-related class to assign to the button.
      def variant_class
        Button.variants[@options[:variant]]
      end

      # @return [#to_s] the type attribute to assign to the button
      def type_attr
        Button.types[@options[:type]] unless @options[:tag] == :link
      end

      # @return [#to_s] the size-related class to assign to the button.
      def size_class
        Button.sizes[@options[:size]]
      end

      # @return [#to_s] the layout-related class to assign to the button.
      def layout_class
        Button.layouts[@options[:layout]]
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible variant.
      private_class_method

      def self.variants
        HashWithIndifferentAccess.new(:'btn-primary').tap do |klass|
          VARIANT_TYPES.each do |variant|
            klass[variant.to_sym] = :"btn-#{variant}"
          end
        end
      end

      # @return [Hash<Symbol, String] the type attribute that Bootstrap uses on input and button tags
      private_class_method

      def self.types
        HashWithIndifferentAccess.new(:button).tap do |klass|
          klass[:button] = :button
          klass[:submit] = :submit
          klass[:reset] = :reset
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible size.
      private_class_method

      def self.sizes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:extra_small] = :'btn-xs'
          klass[:large] = :'btn-lg'
          klass[:lg] = :'btn-lg'
          klass[:sm] = :'btn-sm'
          klass[:small] = :'btn-sm'
          klass[:xs] = :'btn-xs'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.
      private_class_method

      def self.layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:block] = :'btn-block'
        end
      end
    end
  end
end