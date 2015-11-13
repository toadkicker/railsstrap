require 'railsstrap/classes/link_to'
require 'railsstrap/classes/alert_box'
require 'railsstrap/classes/dropdown'
require 'railsstrap/classes/nav'
require 'railsstrap/classes/stack'
require 'railsstrap/classes/vertical'

module Railsstrap
  module Helpers
    # Overrides `link_to` to display a Bootstrap-styled link.
    # Can only be used in Ruby frameworks that provide the `link_to` method.
    # @see http://getbootstrap.com/components/#dropdowns
    # @see http://getbootstrap.com/components/#nav
    # @see http://getbootstrap.com/components/#navbar-brand-image
    # @see http://getbootstrap.com/components/#navbar-links
    # @see http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to
    # @see http://www.rubydoc.info/github/padrino/padrino-framework/Padrino/Helpers/AssetTagHelpers#link_to-instance_method
    # @return [String] the HTML to display a Bootstrap-styled link.
    # @overload link_to(caption, url, options = {})
    #   @param [#to_s] caption the caption to display in the link.
    #   @param [#to_s] url the URL to link to.
    #   @param [Hash] options the options for the original `link_to` method.
    #   @example Display a plain-text link inside an alert-box.
    #       alert_box do
    #         link_to 'Check the terms and conditions', '/#terms'
    #       end
    # @overload button_to(url, options = {}, &block)
    #   @param [#to_s] url the URL to link to (see above).
    #   @param [Hash] options the options for the original `link_to` method.
    #   @yieldreturn [#to_s] the caption to display in the link.
    #   @example Display a link with HTML inside a dropdown.
    #       dropdown 'Menu' do
    #         link_to '/#terms' do
    #           content_tag :strong, 'Check the terms and conditions'
    #         end
    #       end
    def link_to(*args, &block)
      link_to = Railsstrap::LinkTo.new self, *args, &block

      link_to.append_class! :'alert-link' if Railsstrap::Stack.find(Railsstrap::AlertBox)
      link_to.append_class! :'navbar-brand' if Railsstrap::Stack.find(Railsstrap::Vertical)
      link_to.merge! role: :menuitem if Railsstrap::Stack.find(Railsstrap::Dropdown)
      link_to.merge! tabindex: -1 if Railsstrap::Stack.find(Railsstrap::Dropdown)
      html = super link_to.content, link_to.url, link_to.attributes, &nil

      if Railsstrap::Stack.find(Railsstrap::Dropdown)
        container = Railsstrap::Base.new(self) { html }
        container.merge! role: :presentation
        container.render_tag :li
      elsif Railsstrap::Stack.find(Railsstrap::Nav)
        container = Railsstrap::Base.new(self) { html }
        container.append_class! :active if link_to.current_page?
        container.render_tag :li
      else
        html
      end
    end
  end
end