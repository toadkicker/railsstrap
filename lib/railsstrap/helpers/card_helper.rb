require 'railsstrap/classes/card'
require 'railsstrap/classes/card_row'
require 'railsstrap/classes/stack'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled card.
    # @see http://getbootstrap.com/components/#cards
    # @return [String] the HTML to display a Bootstrap-styled card.
    # @overload card(body, options = {})
    #   @param [#to_s] body the content to display as the card body.
    #   @param [Hash] options the options for the card. Any option not
    #     listed below is passed as an HTML attribute to the card’s `<div>`.
    #   @option options [#to_s] :title the text to display as the card title.
    #   @option options [#to_s] :heading the text to display as the card 
    #     heading.
    #   @option options [#to_s] :body the text to display as the card body.
    #     Using this option is equivalent to passing the body as an argument.
    #   @option options [#to_s] :variant (#to_s) (:default) thevariant
    #     alternative to apply to the card heading and border. Can be
    #     `:danger`, `:info`, `:primary`, `:success` or `:warning`.
    #   @option options [#to_s] :tag (#to_s) (:div) the HTML tag to wrap the
    #     card into.
    #   @example Display an informative card with plain-text content.
    #       card 'You accepted the Terms of service.', variant: :success
    # @overload card(options = {}, &block)
    #   @param [Hash] options the options for the card (see above).
    #   @yieldreturn [#to_s] the content to display in the card.
    #   @example Display a card with HTML content.
    #       card title: 'Thanks' do
    #         content_tag :div, class: 'card-body' do
    #           content_tag :em, 'ou accepted the Terms of service.'
    #         end
    #       end
    def card(*args, &block)
      card = Railsstrap::Card.new self, *args, &block
      card.extract! :body, :variant, :title, :tag

      card.append_class! :card
      card.append_class! card.variant_class
      card.merge_html! card.body
      card.extract_content_from :body, card.title
      card_row = Railsstrap::Stack.find(Railsstrap::CardRow)
      if card_row
        container = Railsstrap::Base.new(self) {card.content_tag card.tag}
        container.append_class! card_row.column_class
        container.render_tag :div
      else
        card.render_tag card.tag
      end
    end
  end
end