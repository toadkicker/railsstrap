# frozen_string_literal: true

require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Card < Base
      # Differently from other classes, card works with no content or block,
      # given that the options[:body] is passed, in which case it functions
      # as the content.
      def initialize(app = nil, *args, &block)
        if args.first.is_a?(Hash) && !block_given?
          args.unshift args.first.delete(:body)
        end

        super
      end

      # Content Types (card-title, card-subtitle<Array>, card-header, card-body<Array>, card-footer)

      def title
        @app.content_tag title_tag, @options[:title], class: 'card-title' if @options[:title]
      end

      def subtitle(content)
        @app.content_tag title_tag, content, class: 'card-title' if @options[:title]
      end

      def header(content)
        @app.content_tag
      end

      # Image Cap (top or bottom)

      # @return [#to_s] the optional variant-related class to assign to the card.
      def variant_class
        Card.variants[@options[:variant]] if @options[:variant].present?
      end

      # @return [#to_s] the HTML tag to wrap the card in.
      def tag
        @options.fetch :tag, :div
      end

      def title_tag
        @options.fetch :title_tag, :h3
      end

      def merge_html!(html)
        @content ||= html
      end

      def body(*_args)
        if @options[:body]
          @app.content_tag :div, @options[:body], class: 'panel-body'
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

      # @return [Hash<Symbol, String>] the optional class that Bootstrap uses to
      #   append to an card box based on its variant.
      private_class_method

      def self.variants
        HashWithIndifferentAccess.new(:'card-primary').tap do |klass|
          VARIANT_TYPES.each do |variant|
            klass[variant.to_sym] = :"card-#{variant}"
          end
        end
      end
    end
  end
end
