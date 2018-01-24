require 'railsstrap/classes/card'
require 'railsstrap/classes/card_row'
require 'railsstrap/classes/stack'

module Railsstrap
  module Helpers
    # Wraps a set of Bootstrap-styled cards in a row.
    # @see http://getbootstrap.com/components/#cards
    # @see http://getbootstrap.com/css/#grid
    # @return [String] the HTML to display a row of Bootstrap-styled cards.
    # @param [Hash] options the options for the row. Any option not
    #   listed below is passed as an HTML attribute to the row’s `<div>`.
    # @option options [#to_s] :column_class the class to wrap each card with.
    #   Useful to specify a grid size for the column such as 'col-sm-4' to
    #   indicate how many columns of the row each card should occupy.
    # @yieldreturn [#to_s] the cards to display in a row.
    # @example Display a row of two cards with the same width.
    #   card_row column_class: 'col-sm-6' do
    #     card 'card #1', variant: :success
    #     card 'card #2', variant: :info
    #   end
    def card_row(options = {}, &block)
      card_row = Railsstrap::CardRow.new self, options, &block
      card_row.extract! :column_class

      card_row.append_class! :row
      card_row.render_tag :div
    end
  end
end