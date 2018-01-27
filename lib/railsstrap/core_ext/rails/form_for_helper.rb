# frozen_string_literal: true

require 'railsstrap/core_ext/rails/base_helper'
require 'railsstrap/core_ext/rails/form_builder'

module Railsstrap
  module Rails
    module Helpers
      include BaseHelper
      include ActionView::Helpers::FormHelper # for form_for

      def form_for(record, options = {}, &block)
        options[:layout] ||= 'navbar' if Railsstrap::Stack.find(Railsstrap::Navbar)
        add_form_options!(options) if options[:layout]
        html = super record, options, &block

        if Railsstrap::Stack.find(Railsstrap::Nav)
          container = Railsstrap::Base.new(self) { html }
          container.render_tag :li
        else
          html
        end
      end

      private

      def add_form_options!(options)
        options[:html] ||= {}
        options[:html][:role] = 'form'
        append_class! options[:html], class_for(options[:layout])
        options.merge! builder: FormBuilder
      end

      def class_for(layout)
        case layout.to_s
        when 'navbar' then
          'navbar-form'
        when 'inline' then
          'form-inline'
        when 'horizontal' then
          'form-horizontal'
        end
      end
    end
  end
end
