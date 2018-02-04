require 'railsstrap/helpers/horizontal_helper'
require 'railsstrap/helpers/vertical_helper'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled navbar.
    # @see http://getbootstrap.com/components/docs/4.0/navbar
    # @return [String] the HTML to display a Bootstrap-styled navbar.
    # @param [Hash] options the options for the navbar. Any option not listed
    #   below is ignored, except for `:id` which is passed as an HTML
    #   attribute to the navbar’s collapsable `<div>`.
    # @option options [Boolean] :fluid (false) whether to use a fluid container
    #   to surround the navbar content.
    # @option options [Boolean] :inverted (false) whether to use an inverted
    #   palette of colors.
    # @option options [#to_s] :position the position of the navbar. Can be
    #   `:top` (alias `:fixed_top`), `:bottom` (alias `:fixed_bottom`) or
    #   `:static` (alias `:static_top`).
    # @yieldreturn [#to_s] the content to display in the navbar.
    # @example Display an inverted navbar with three links.
    #   navbar inverted: true do
    #     vertical do
    #       image_tag('logo')
    #     end
    #     horizontal do
    #       nav do
    #         link_to 'Home', '/'
    #         link_to 'Profile', '/profile'
    #       end
    #     end
    #   end
    def navbar(options = {}, &block)
      navbar = Railsstrap::Navbar.new(self, options, &block)
      navbar.extract! :variant, :text_variant, :position, :fluid

      navbar.append_class! :navigation, :navbar
      navbar.append_class! :navigation, navbar.variant_class
      navbar.append_class! :navigation, 'navbar-expand-lg'
      navbar.append_class! :navigation, navbar.text_variant_class
      navbar.append_class! :navigation, navbar.position_class
      navbar.append_class! :div, navbar.layout_class
      navbar.render_tag :nav
    end
  end
end