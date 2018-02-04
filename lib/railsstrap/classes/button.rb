# frozen_string_literal: true
require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Button < Base
      # @return [#to_s] the variant-related class to assign to the button.
      def variant_class
        Button.variants[@options[:variant]]
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

      def self.variants
        HashWithIndifferentAccess.new(:'btn-primary').tap do |klass|
          variant_types.each do |variant|
            klass[variant.to_sym] = :"btn-#{variant}"
            klass[:"outline-#{variant}"] = :"btn-outline-#{variant}"
          end
          klass[:link] = :'btn-link'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible size.

      def self.sizes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:extra_small] = :'btn-xs'
          klass[:large]       = :'btn-lg'
          klass[:lg]          = :'btn-lg'
          klass[:sm]          = :'btn-sm'
          klass[:small]       = :'btn-sm'
          klass[:xs]          = :'btn-xs'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.

      def self.layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:block] = :'btn-block'
        end
      end

      # @return [Hash<Symbol>, String] the javascript to toggle or dispose a button.
      # @required @options[:id]

      def self.js_methods
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:toggle] = "$(#{@options[:id]}).button('toggle')"
          klass[:dispose] = "$(#{@options[:id]}).button('dispose')"
        end
      end
    end
  end
end