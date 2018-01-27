module Railsstrap
  module Helpers
    # @return [String] an HTML block to display a dropdown.
    # @example errors_for(@widgets)
    # @description Displays a Bootstrap card containing form errors
    def errors_for(object)
      if object.errors.any?
        content_tag(:div, class: 'card card-danger') do
          concat(content_tag(:div, class: 'card-header') do
            concat(content_tag(:h4, class: 'card-title') do
              concat "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"
            end)
          end)
          concat(content_tag(:div, class: 'card-block') do
            concat(content_tag(:ul) do
              object.errors.full_messages.each do |msg|
                concat content_tag(:li, msg)
              end
            end)
          end)
        end
      end
    end
  end
end