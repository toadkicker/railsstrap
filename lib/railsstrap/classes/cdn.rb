# frozen_string_literal: true

require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    # @api private
    class Cdn
      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.jquery_js(options = {})
        options[:version] ||= '3.3.1'
        cdn_asset options.merge(library: 'jquery')
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.bootstrap(options = {})
        options[:version] ||= '4.0.0'
        cdn_asset options.merge(library: 'bootstrap')
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.font_awesome(options = {})
        options[:version] ||= '4.7.0'
        cdn_asset options.merge(library: 'font-awesome')
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.font_awesome_js(options = {})
        options[:version] ||= '5.0.6'
        options[:scheme] ||= 'https'
        options[:host] ||= '//use.fontawesome.com'
        options[:path] ||= 'releases/v5.0.6/js'
        options[:name] ||= 'all'
        options[:ext] ||= 'js'
        cdn_asset options.merge(library: 'font-awesome')
      end

      def self.popper_js(options = {})
        options[:version] ||= '1.13.0'
        cdn_asset options.merge(library: 'popper')
      end

      def self.cdn_asset(options = {})
        version = options[:version]
        extension = options[:extension]
        name = options[:name]
        name = "#{name}.min" if options.fetch(:minified, true)
        library = options[:library]
        scheme = options[:scheme].present? ? "#{options[:scheme]}:" : 'http:'
        path = (options[:path]).to_s || 'ajax/libs'
        host = "#{scheme}//cdnjs.cloudflare.com"
        "#{host}/#{path}/#{library}/#{version}/#{extension}/#{name}.#{extension}"
      end
    end
  end
end
