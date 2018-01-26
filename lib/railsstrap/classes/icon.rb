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
        return if @options[:name]
        "#{library_class}-#{name.to_s.gsub '_', '-'}"
      end



      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to icons for each possible vector icon library.
      private_class_method
      def self.libraries
        HashWithIndifferentAccess.new(nil).tap do |klass|
          klass[:font_awesome]  = :'fas'
          klass[:fas]  = :'fas' # font awesome solid
          klass[:far]  = :'far' # font awesome regular
          klass[:fal]  = :'fal' # font awesome light
          klass[:fal]  = :'fab' # font awesome light
          klass[:glyphicons]    = :'glyphicon'
          klass[:'']            = :'far'
        end
      end
    end
  end
end