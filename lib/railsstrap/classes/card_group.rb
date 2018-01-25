require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class CardGroup < Base
      # @return [#to_s] the grid-related class to assign to each card
      #   nested in this card group.
      def column_class
        @options[:column_class]
      end
    end
  end
end