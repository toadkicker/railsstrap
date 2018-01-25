require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Card < Base
      # Differently from other classes, Panel works with no content or block,
      # given that the options[:body] is passed, in which case it functions
      # as the content.
      def initialize(app = nil, *args, &block)
        if args.first.is_a?(Hash) && !block_given?
          args.unshift args.first.delete(:body)
        end

        super
      end

      # @return [#to_s] the content-related class to assign to the card.
      def variant_class
        Card.variants[@options[:variant]]
      end

      # @return [#to_s] the HTML tag to wrap the card in.
      def tag
        @options.fetch :tag, :div
      end

      # @return [#to_s] the text to display as the card header
      def header
        text = title || @options[:header]
        @app.content_tag :div, text, class: 'card-header' if text
      end

      def image_cap
        if @options[:img]
          @app.content_tag :img, nil, class: 'card-img-top', src: @options[:img]
        end
      end
      def body
        if @options[:body]
          @app.content_tag :div, @options[:body], class: 'card-body'
        end
      end

      private_class_method
      def extract_content_from(*args, &block)
        if block_given?
          super
        else
          @app.content_tag :div, super, class: 'card-body'
        end
      end

      private_class_method
      def title
        if @options[:title]
          @app.content_tag :h3, @options[:title], class: 'card-title'
        end
      end

      # @return [Hash<Symbol, String>] the class that Bootstrap requires to
      #   append to an card box based on its variant.
      private_class_method
      def self.variants
        HashWithIndifferentAccess.new(:'card-default').tap do |klass|
          variant_types.each { |variant| klass[variant.to_sym] = :"card-#{variant}" }
        end
      end

    end
  end
end