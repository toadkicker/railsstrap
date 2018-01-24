require 'railsstrap/classes/aside'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled aside.
    # @see http://getbootstrap.com/javascript/#asides
    # @return [String] the HTML to display a Bootstrap-styled aside.
    # @overload aside(body, options = {})
    #   @param [#to_s] body the content to display as the aside body.
    #   @param [Hash] options the options for the aside. Any option not listed
    #     below is ignored, except for `:id` which is passed as an HTML
    #     attribute to the aside’s `<div>`.
    #   @option options [#to_s] :title ('Aside') the title of the aside.
    #   @option options [#to_s] :body the content to display as the aside body.
    #     Using this option is equivalent to passing the body as an argument.
    #   @option options [#to_s] :size the size of the aside. Can be `:large`
    #     (alias `:lg`) or `:small` (alias `:sm`).
    #   @option options [Hash] :button the options for the toggle button.
    #     * :caption (#to_s) ('Aside') the caption of the toggle button.
    #     * :variant (#to_s) (:default) the variant alternative to apply to
    #        the toggle button. Can be `:danger`, `:info`, `:link`, `:primary`,
    #       `:success` or `:warning`.
    #     * :size (#to_s) the size of the toggle button. Can be `:extra_small`
    #       (alias `:xs`), `:large` (alias `:lg`) or `:small` (alias `:sm`).
    #     * :layout (#to_s) if set to `:block`, span the button for the full
    #       width of the parent.
    #   @example Display a simple aside toggled by a blue button.
    #       aside 'You clicked me!', title: 'Click me', button: {variant: :info}
    # @overload aside(options = {}, &block)
    #   @param [Hash] options the options for the aside (see above).
    #   @yieldreturn [#to_s] the content to display in the aside.
    #   @example Display a aside with HTML content.
    #       aside title: 'Click me' do
    #         content_tag :div, class: 'aside-body' do
    #           content_tag :em, 'You clicked me!'
    #         end
    #       end
    def aside(*args, &block)
      aside = Railsstrap::Aside.new self, *args, &block
      aside.extract! :button, :size, :body, :title, :id, :side, :animation

      aside.extract_from :button, [:variant, :size, :layout, :caption]
      aside.append_class_to! :button, :btn
      aside.append_class_to! :button, aside.button_variant_class
      aside.append_class_to! :button, aside.button_size_class
      aside.merge! button: {caption: aside.caption}

      aside.append_class_to! :div, :'aside-dialog'
      aside.append_class_to! :div, aside.dialog_size_class
      aside.append_class_to! :div, aside.side
      aside.append_class_to! :div, aside.animation_class
      aside.merge! div: {title: aside.title, id: aside.id}

      aside.render_partial 'aside'
    end
  end
end