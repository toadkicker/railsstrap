require 'railsstrap/classes/alert_box'

module Railsstrap
  module Helpers
    # Displays a Bootstrap-styled alert message.
    # @see http://getbootstrap.com/components/#alerts
    # @return [String] the HTML to display a Bootstrap-styled alert message.
    # @overload bootstrap_flash(content, options = {})
    #   @param [#to_s] content the content to display in the alert.
    #   @param [Hash] options the options for the alert box. Any option not
    #     listed below is passed as an HTML attribute to the alert’s `<div>`.
    #   @option options [Boolean] :dismissible (false) whether to display an
    #     '×' to the right of the box that can be clicked to dismiss the alert.
    #   @option options [#to_s] :variant (:info) thevariant alternative to
    #     apply to the alert. Can be `:danger`, `:info`, `:success` or
    #     `:warning`.
    #   @option options [#to_s] :variant if set to one of the variant levels
    #     of Rails flash contents, determines the variant of the alert box.
    #     Can be :alert or :notice.
    #   @example Display a dismissible alert box with a plain-text content.
    #       bootstrap_flash 'User updated successfully', dismissible: true
    # @overload bootstrap_flash(options = {}, &block)
    #   @param [Hash] options the options for the alert box (see above).
    #   @yieldreturn [#to_s] the content to display in the alert.
    #   @example Display a success alert box with an HTML content.
    #       bootstrap_flash variant: :success do
    #         content_tag :strong, 'User updated successfully'
    #       end
    # @dependencies alert_box
    def bootstrap_flash(options = {})

      flash_messages = []

      flash.each do |type, message|
        # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
        next if message.blank?

        # In Railsstrap 3.2 show_close was used instead of dismissible.
        options[:show_close] ? options[:dismissible] = true : options[:show_close]

        opts = {
          dismissible: true,
          type: :info,
          container_tag: :div,
        }.merge(options)

        #reassign traditional rails flash types to bootstrap types
        type = type.to_sym
        type = :success if type == :notice
        type = :danger if type == :alert
        type = :danger if type == :error
        next unless VARIANT_TYPES.include?(type)

        Array(message).each do |msg|

          text = alert_box variant: type, class: opts[:class], dismissible: opts[:dismissible] do
            content_tag opts[:container_tag], msg
          end

          flash_messages << text if msg
        end
      end

      flash_messages.join("\n").html_safe
    end
  end
end