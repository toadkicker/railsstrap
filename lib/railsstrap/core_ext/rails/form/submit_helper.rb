require 'railsstrap/core_ext/rails/form/base_helper'

module Railsstrap
  module Form
    module SubmitHelper
      include BaseHelper

      def submit(value=nil, options={})
        variant = options.delete(:variant) || 'primary'
        append_class! options, "btn btn-#{variant}"
        if horizontal_form?
          content_tag :div, class: 'form-group' do
            content_tag :div, class: 'col-sm-offset-3 col-sm-9' do
              super value, options
            end
          end
        else
          super value, options
        end
      end
    end
  end
end