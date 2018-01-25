require 'railsstrap/helpers/card_helper'

module Railsstrap
  module Form
    module FieldsetHelper
      include BaseHelper
      include Railsstrap::Helpers # for panel

      def fieldset(title = nil, &block)
        options = {tag: :fieldset, body: @template.capture(&block)}
        options[:heading] = title if title.present? && !inline_form?
        card options
      end
    end
  end
end