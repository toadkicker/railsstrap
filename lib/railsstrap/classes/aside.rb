require 'railsstrap/classes/button'

module Railsstrap
  module Classes
    class Aside < Base
      # Differently from other classes, Aside works with no content or block,
      # given that the options[:body] is passed, in which case it functions
      # as the content.
      def initialize(app = nil, *args, &block)
        if args.first.is_a?(Hash) && !block_given?
          args.unshift args.first.delete(:body)
        end

        super
      end

      # @return [#to_s] the variant-related class to assign to the aside button.
      def button_variant_class
        Button.variants[@options.fetch(:button, {})[:variant]]
      end

      # @return [#to_s] the size-related class to assign to the aside button.
      def button_size_class
        Button.sizes[@options.fetch(:button, {})[:size]]
      end

      # @return [#to_s] the size-related class to assign to the aside dialog.
      def dialog_size_class
        Aside.dialog_sizes[@options[:size]]
      end

      # @return [#to_s] the caption for the aside button.
      def caption
        @options.fetch(:button, {}).fetch :caption, title
      end

      # @return [#to_s] the title to display on top of the aside dialog.
      def title
        @options.fetch :title, 'Aside'
      end

      def id
        @options.fetch :id, "aside-#{rand 10 ** 10}"
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to the aside dialog for each possible size.
      private
      def self.dialog_sizes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:large] = :'aside-lg'
          klass[:lg] = :'aside-lg'
          klass[:sm] = :'aside-sm'
          klass[:small] = :'aside-sm'
        end
      end

      def extract_content_from(*args, &block)
        if block_given?
          super
        else
          @app.content_tag :div, super, class: 'aside-body'
        end
      end
    end
  end
end