require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class ButtonGroup < Base
      # @return [#to_s] the variant-related class to assign to the button.
      def variant_class
        Button.variants[@options[:variant]]
      end

      # @return [#to_s] the size-related class to assign to the button group.
      def size_class
        Button.sizes[@options[:size]]
      end

      # @return [#to_s] the layout-related class to assign to the button group.
      def layout_class
        Button.layouts[@options[:layout]]
      end

      def vertical_class
        @options[:vertical].present? ? 'btn-group-vertical' : nil
      end

      def toolbar_class
        @options[:toolbar].present? ? 'btn-toolbar' : nil
      end

      def role_name
        { role: @options[:role] ||= 'group' }
      end

      def aria_label
        @options[:'aria-label'] ||= 'Button Group'
      end

      def buttons
        @options[:buttons].map! {|button| @app.button(button)} if @options[:buttons]
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible size.
      private_class_method
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
      private_class_method
      def self.layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:block] = :'btn-block'
        end
      end
      
    end
  end
end