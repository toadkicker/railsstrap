require 'railsstrap/classes/base'

module Railsstrap
  module Helpers
    def bootstrap_flash(options = {})

      flash_messages = []
      close_button = content_tag(:button, raw('&times;'), :type => 'button', :class => 'close', 'data-dismiss' => 'alert')

      flash.each do |type, message|
        default_opts = {
          show_close: true,
          type: :info,
          container_tag: :div,
          animation: 'animate fade show'
        }
        opts = default_opts.merge(options)

        # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
        next if message.blank?

        type = type.to_sym
        type = :info if type == :notice
        type = :warning if type == :alert
        type = :danger if type == :error
        next unless Railsstrap::Classes::Base.variant_types.include?(type)

        Array(message).each do |msg|

          text = content_tag(opts[:container_tag],
                             (opts[:show_close] ? close_button : '') +
                               msg.html_safe, :class => "alert #{opts[:animation]} alert-#{type} #{opts[:class]}")
          flash_messages << text if msg
        end
      end
      flash_messages.join("\n").html_safe
    end
  end
end