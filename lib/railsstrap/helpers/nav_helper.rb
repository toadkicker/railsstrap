require 'railsstrap/classes/nav'
require 'railsstrap/classes/navbar'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled nav.
    # @see http://getbootstrap.com/components/docs/4.0/nav
    # @return [String] the HTML to display a Bootstrap-styled nav.
    # @param [Hash] options the options for the nav. Any option not listed below
    #   is passed as an HTML attribute to the alert’s `<ul>`.
    # @option options [#to_s] the style of the nav. Can be `:tabs`
    #   or `:pills`.
    # @option options [#to_s] :layout the layout of the nav. Can be
    #   `:justified`, `:center`, `:right`, `:fill`, or `:stacked`.
    # @yieldreturn [#to_s] the content to display in the nav.
    # @example Display a pills-styled nav with a link.
    #   nav as: :pills do
    #     link_to 'Home', '/'
    #   end
    def nav(options = {}, &block)
      nav = Railsstrap::Nav.new(self, options, &block)
      nav.extract! :as, :layout

      nav.append_class! :nav
      nav.append_class! nav.style_class
      nav.append_class! nav.layout_class
      nav.merge! role: :navigation



      nav.render_tag :nav
    end
  end
end