module Railsstrap
  module Helpers
    # @return [String] an HTML block to display a dropdown.
    # @example errors_for(@widgets)
    # @description Displays a Bootstrap card containing form errors.
    #   If a block is provide, uses the block for handling the error message output.
    #   Inherits all the same properties as Railsstrap::Classes::Card
    # @options [param] Change the title text and styling of the errors
    # @options option [#to_s] :variant
    def errors_for(object, options = {}, &block)
      if object.errors.any?
        opts = {
          body: content_tag(:ol) {
            object.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          },
          variant: :danger,
          text_variant: 'text-white',
          header: "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"
        }.merge options
        card = Railsstrap::Classes::Card.new(self, opts, &block)
        card.extract! :body, :variant, :text_variant, :title, :header, :tag, :img

        card.append_class! :card
        card.append_class! card.variant_class
        card.append_class! card.text_variant_class
        card.prepend_html! card.image_cap
        card.merge_html! card.body
        card.prepend_html! card.header
        card.render_tag card.tag

      end
    end
  end
end