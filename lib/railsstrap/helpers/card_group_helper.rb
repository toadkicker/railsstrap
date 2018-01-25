require 'railsstrap/classes/card_group'

module Railsstrap
  module Helpers
    # Wraps a set of Bootstrap-styled cards in a row.
    # @see http://getbootstrap.com/components/docs/4.0/cards
    # @see http://getbootstrap.com/css/#grid
    # @return [String] the HTML to display a row of Bootstrap-styled cards.
    # @param [Hash] options the options for the row. Any option not
    #   listed below is passed as an HTML attribute to the row’s `<div>`.
    # @option options [#to_s] :layout the class to wrap each card with.
    #   Useful to specify a grid size for the column such as 'col-sm-4' to
    #   indicate how many columns of the row each card should occupy.
    # @yieldreturn [#to_s] the cards to display in a row.
    # @example Display a row of two cards with the same width.
    #   card_group layout: 'col-sm-6' do
    #     card 'Panel #1', context: :success
    #     card 'Panel #2', context: :info
    #   end
    def card_group(options = {}, &block)
      card_group = Railsstrap::CardGroup.new self, options, &block
      card_group.extract! :layout

      card_group.append_class! card_group.layout
      card_group.render_tag :div
    end
  end
end