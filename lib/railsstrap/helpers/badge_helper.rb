require 'railsstrap/classes/badge'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled badge message.
    # @see http://getbootstrap.com/components/docs/4.0/badges
    # @return [String] the HTML to display a Bootstrap-styled badge message.
    # @overload badge(content, options = {})
    #   @param [#to_s] content the content to display in the badge.
    #   @param [Hash] options the options for the badge. Any option not
    #     listed below is passed as an HTML attribute to the badge’s `<div>`.
    #   @option options [Boolean] :dismissible (false) whether to display an
    #     '×' to the right of the box that can be clicked to dismiss the badge.
    #   @option options [#to_s] :variant (:info) the variant alternative to
    #     apply to the badge. Can be `:danger`, `:info`, `:success` or
    #     `:warning`.
    #   @option options [#to_s] :priority if set to one of the priority levels
    #     of Rails flash contents, determines the variant of the badge.
    #     Can be :badge or :notice.
    #   @example Display a dismissible badge with a plain-text content.
    #       badge 'User updated successfully', dismissible: true
    # @overload badge(options = {}, &block)
    #   @param [Hash] options the options for the badge (see above).
    #   @yieldreturn [#to_s] the content to display in the badge.
    #   @example Display a success badge with an HTML content.
    #       badge variant: :success do
    #         content_tag :strong, 'User updated successfully'
    #       end
    def badge(*args, &block)
      badge = Railsstrap::Badge.new(self, *args, &block)
      badge.extract! :variant, :priority, :dismissible

      badge.append_class! :badge
      badge.append_class! badge.variant_class
      badge.append_class! badge.pill_class
      badge.merge! role: :badge
      badge.prepend_html! badge.dismissible_button
      badge.render_tag
    end
  end
end