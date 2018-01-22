# Railsstrap Datepicker Helper
# Based on https://tempusdominus.github.io/bootstrap-4

# Setup instructions:
# open your application.js & application.css asset manifest file and uncomment the block to include the UI libraries
# use the date_picker helper for the html and the date_picker_javascript helper in your templates
#
# If passing data attributes as symbols, please use underscore to separate words; otherwise pass strings.
# The full JS API is supported as data attributes or javascript.
#
# You can use the HTML helper which will handle the javascript configuration for you, or use the JS helper
# and create your own standard bootstrap form input group.
#
# <div class="form-group">
#   <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
#     <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
#     <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
#     <div class="input-group-text"><i class="fa fa-calendar"></i></div>
#   </div>
# </div>

module Railsstrap
  module DatePickerHelper

    def date_picker(options = {})
      opts = default_dp_options.deep_merge(options)
      content_tag(:div, class: "input-group date #{opts[:class]}", id: opts[:id], data: opts[:data]) {
        opts[:show_input] ? date_picker_input(opts) + date_picker_icon(opts) : date_picker_icon(opts)
      }
    end

    def date_picker_icon(options = {})
      opts = default_dp_options.deep_merge(options)
      content_tag opts[:icon_wrapper_tag], class: opts[:icon_wrapper_class] {
        content_tag :i, '', class: opts[:icon]
      }
    end

    def date_picker_input(options = {})
      opts = default_dp_options.deep_merge(options)
      text_field_tag opts[:input_name], '', class: opts[:input_class]
    end

    def date_picker_javascript(options = {})
      opts = default_js_options.deep_merge(options)
      javascript_tag "(function ($) { $('#{opts[:selector]}').datetimepicker(#{opts.to_json});})(jQuery);"
    end

    protected
    def default_dp_options
      {
        id: 'date_picker',
        wrapper_tag: :div,
        show_input: true,
        input_name: 'date_picker',
        input_class: 'form-control datetimepicker-input',
        input_type: 'text',
        wrapper_class: 'input-group date',
        icon_wrapper_tag: :span,
        icon_wrapper_class: 'input-group-append',
        icon: 'fa fa-calendar',
        data: {datepicker: true, locale: 'en', target_input: 'nearest'}
      }
    end

    def default_js_options
      {
        selector: '[data-datepicker="true"]',
        language: 'en',
        icons: {
          time: 'fa fa-clock-o',
          date: 'fa fa-calendar',
          up: 'fa fa-chevron-up',
          down: 'fa fa-chevron-down'
        }
      }
    end
  end
end