require 'railsstrap/helpers/card_helper'

module Railsstrap
  module Form
    module FieldsetHelper
      include BaseHelper
      include Railsstrap::Helpers # for card

      def fieldset(title = nil, &block)
        options = {tag: :fieldset, body: @template.capture(&block)}
        options[:header] = title if title.present? && !inline_form?
        card options
      end
    end
  end
end