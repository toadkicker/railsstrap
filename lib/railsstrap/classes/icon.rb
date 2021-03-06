# frozen_string_literal: true
require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    # @api private
    class Icon < Base
      # @return [#to_s] the class to assign to the icon based on the Vector
      #   Icon library used. If not defined here pass through what was provided.
      def library_class
        Icon.libraries[@options[:library].to_s.underscore] || @options[:library]
      end

      # @return [#to_s] the class to assign to the icon based on the name
      #   of the icon.
      def name_class
        return "fa-#{@options[:name].to_s.gsub '_', '-'}" if %i[fas far fab fal].include? library_class
        "#{library_class}-#{@options[:name].to_s.gsub '_', '-'}"
      end

      # @return [#to_s] the icon html tag to use
      def tag
        @options[:tag] || :i
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to icons for each possible vector icon library.
      def self.libraries
        HashWithIndifferentAccess.new(nil).tap do |klass|
          klass[:font_awesome] = :'fas'
          klass[:fas] = :'fas' # font awesome solid
          klass[:far] = :'far' # font awesome regular
          klass[:fal] = :'fal' # font awesome light
          klass[:fal] = :'fab' # font awesome brands
          klass[:glyphicons] = :'glyphicon'
          klass[:''] = :'far'
        end
      end
    end
  end
end