require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class CardGroup < Base

      def layout
        CardGroup.column_types[@options[:layout]]
      end

      # @return [#to_s] the grid-related class to assign to each card
      #   nested in this card group.
      def self.column_types
        HashWithIndifferentAccess.new('card-group').tap do |klass|
          klass[:deck] = :'card-deck'
          klass[:group] = :'card-group'
          klass[:column] = :'card-column'
        end
      end
    end
  end
end