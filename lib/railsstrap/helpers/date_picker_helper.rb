# Railsstrap Datepicker Helper
#
# Setup instructions:
# open your application.js & application.css asset manifest file and uncomment the block to include the UI libraries
# use the date_picker helper for the html and the date_picker_javascript helper in your templates
#
# You can set these options a few ways:
# with html data-date-{OPTIONNAME},
# or pass a data option hash into date_picker, but change the key name to_underscore format so content_tag renders the data tag properly.
# or in date_picker_javascript, keeping it as camelCase
#
# pickDate: true,                 //en/disables the date picker
# pickTime: true,                 //en/disables the time picker
# useMinutes: true,               //en/disables the minutes picker
# useSeconds: true,               //en/disables the seconds picker
# useCurrent: true,               //when true, picker will set the value to the current date/time
# minuteStepping:1,               //set the minute stepping
# minDate:`1/1/1900`,               //set a minimum date
# maxDate: ,     //set a maximum date (defaults to today +100 years)
# showToday: true,                 //shows the today indicator
# language:'en',                  //sets language locale
# defaultDate:"",                 //sets a default date, accepts js dates, strings and moment objects
# disabledDates:[],               //an array of dates that cannot be selected
# enabledDates:[],                //an array of dates that can be selected
# icons = {
#     time: 'glyphicon glyphicon-time',
#     date: 'glyphicon glyphicon-calendar',
#     up:   'glyphicon glyphicon-chevron-up',
#     down: 'glyphicon glyphicon-chevron-down'
# }
# useStrict: false,               //use strict when validating dates
# sideBySide: false,              //show the date and time picker side by side
# daysOfWeekDisabled:[]          //for example use daysOfWeekDisabled: [0,6] to disable weekends
#

module Railsstrap
  module DatePickerHelper

    def date_picker(options = {})
      opts = default_dp_options.merge(options)
      content_tag(opts[:wrapper_tag], id: opts[:id], class: opts[:wrapper_class], data: opts[:data]) {
        opts[:show_input] ? date_picker_input(opts) + date_picker_icon(opts) : date_picker_icon(opts)
      }
    end

    def date_picker_icon(options = {})
      opts = default_dp_options.merge(options)
      content_tag opts[:icon_wrapper_tag], class: opts[:icon_wrapper_class] {
        content_tag :i, '', class: opts[:icon]
      }
    end

    def date_picker_input(options = {})
      opts = default_dp_options.merge(options)
      text_field_tag opts[:input_name], '', class: opts[:input_class]
    end

    def date_picker_javascript(options = {})
      opts = default_js_options.merge(options)
      javascript_tag "(function ($) { $('#{opts[:selector]}').datetimepicker(#{opts.to_json});})(jQuery);"
    end

    protected
    def default_dp_options
      { id: 'date_picker',
        wrapper_tag: :div,
        show_input: true,
        input_name: 'date_picker',
        input_class: 'form-control',
        input_type: 'text',
        wrapper_class: 'input-group date',
        icon_wrapper_tag: :span,
        icon_wrapper_class: 'input-group-addon',
        icon: 'fa fa-calendar',
        data: { datepicker: true, date_language: 'en' }
      }
    end

    def default_js_options
      {
          selector: '[data-datepicker="true"]',
          language: 'en',
          icons: {
              time: 'fa fa-clock-o',
              date: 'fa fa-calendar',
              up:   'fa fa-chevron-up',
              down: 'fa fa-chevron-down'
          }
      }
    end
  end
end