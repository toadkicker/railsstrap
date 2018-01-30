# frozen_string_literal: true

require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    # @api private
    class Cdn
      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.jquery_js(options = {})
        options[:version] = options[:version].nil? ? '3.3.1' : options[:version]
        cdn_asset options.merge(library: 'jquery')
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.bootstrap_css(options = {})
        defaults = {version: '4.0.0', scheme: :https, minified: true}
        options.merge!(defaults)
        "#{options[:scheme].to_s}://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{options[:version]}/css/bootstrap.#{options[:minified] ? 'min.' : '.'}css"
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      # @note Version 4 of bootstrap does not have a theme; use SASS in this situation and override variables
      def self.bootstrap_theme(options = {})
        defaults = {version: '3.3.7', scheme: :https, minified: true}
        options.merge!(defaults)
        return if options[:version] =~ !/^3/
        "#{options[:scheme].to_s}://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{options[:version]}/css/bootstrap-theme.#{options[:minified] ? 'min.' : ''}css"
      end

      def self.bootstrap_js(options = {})
        defaults = {version: '4.0.0', scheme: :https, minified: true}
        options.merge!(defaults)
        "#{options[:scheme].to_s}://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{options[:version]}/js/bootstrap.#{options[:minified] ? 'min.' : '.'}js"
      end

      # @note if unspecified, the version should match the latest available
      #   version. If that's not the case, it's a bug and should be fixed.
      def self.font_awesome(options = {})
        defaults = {version: '4.7.0', scheme: :https, minified: true}
        options.merge!(defaults)
        "#{options[:scheme].to_s}://cdnjs.cloudflare.com/ajax/libs/font-awesome/#{options[:version]}/css/font-awesome.#{options[:minified] ? 'min.' : '.'}css"
      end

      # @description Use the cdn_asset method to build a URL
      def self.font_awesome_js(options = {})
        version = '5.0.6'
        opts = {
          version: version,
          scheme: 'https',
          host: '//use.fontawesome.com',
          path: "releases/v#{version}/js",
          name: 'all',
          ext: 'js'
        }.merge(options)
        cdn_asset opts
      end

      # fetches popper js
      def self.popper_js(options = {})
        opts = {
          version: '1.13.0',
          path: 'ajax/libs/popper.js'
        }.merge(options)
        cdn_asset opts
      end

      # @return the url of the library from cdnjs.com
      # def self.query(options = {})
      #   return if options[:library].nil?
      #   buffer = open("https://api.cdnjs.com/libraries?search=#{options[:library]}&fields=version,assets").read
      #   JSON.parse(buffer)
      # end

      # @note The problem with this method is there is no real sanity with CDN naming conventions
      # Considering using API to smartly figure out what is being asked of the helper to link in
      def self.cdn_asset(options = {})
        version = options[:version]
        extension = options[:extension]
        name = options[:name]
        name = "#{name}.min" if options.fetch(:minified, true)
        library = options[:library]
        scheme = options[:scheme].nil? ? 'https:' : "#{options[:scheme]}:"
        path = options[:path].nil? ? 'ajax/libs' : options[:path].to_s
        host = options[:host].nil? ? "#{scheme}//cdnjs.cloudflare.com" : options[:host]
        "#{host}/#{path}/#{library}/#{version}/#{name}.#{extension}"
      end
    end
  end
end
