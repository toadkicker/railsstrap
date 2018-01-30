require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Vertical < Base
      def toggle_button(navbar_id, options = {})
        options[:class]         = :'navbar-toggler'
        options[:'data-target'] = :"##{navbar_id}"
        options[:'data-toggle'] = :collapse
        options[:type]          = :button
        options[:'aria-label']  = 'Toggle navigation'
        options[:'aria-controls']  = :"##{navbar_id}"
        @app.content_tag :button, options do
          safe_join [toggle_text, toggle_bar]
        end
      end

    private

      def toggle_text
        @app.content_tag :span, 'Toggle navigation', class: :'sr-only'
      end

      def toggle_bar
        @app.content_tag :span, nil, class: :'navbar-toggler-icon'
      end
    end
  end
end