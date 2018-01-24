require 'railsstrap/core_ext/rails/form/check_box_helper'
require 'railsstrap/core_ext/rails/form/field_helper'
require 'railsstrap/core_ext/rails/form/fieldset_helper'
require 'railsstrap/core_ext/rails/form/fields_for_helper'
require 'railsstrap/core_ext/rails/form/file_field_helper'
require 'railsstrap/core_ext/rails/form/legend_helper'
require 'railsstrap/core_ext/rails/form/radio_button_helper'
require 'railsstrap/core_ext/rails/form/select_helper'
require 'railsstrap/core_ext/rails/form/static_control_helper'
require 'railsstrap/core_ext/rails/form/submit_helper'

module Railsstrap
  # @api private
  class FormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::SanitizeHelper
    extend ActionView::Helpers::SanitizeHelper::ClassMethods
    include Form::CheckBoxHelper
    include Form::FieldHelper
    include Form::FieldsetHelper
    include Form::FieldsForHelper
    include Form::FileFieldHelper
    include Form::LegendHelper
    include Form::RadioButtonHelper
    include Form::SelectHelper
    include Form::StaticControlHelper
    include Form::SubmitHelper

    # @note: field_helpers are returned as symbols in ActionView 4 and as
    #   strings in ActionView 3
    def self.textual_field_helpers
      non_textual_field_helpers = %w(label hidden_field range_field check_box
        file_field radio_button select submit fields_for label)
      field_helpers.map(&:to_s) - non_textual_field_helpers
    end

    # Use the same template for all the textual field helpers such as
    # email_field, password_field, etc.
    # Exclude the ones that should not have additional styles.
    # Do not show error icons on number_field not to cover the sliders.
    textual_field_helpers.each do |field_type|
      define_method field_type do |method, options = {}|
        field(method, field_type, options) { super method, options }
      end
    end
  end
end