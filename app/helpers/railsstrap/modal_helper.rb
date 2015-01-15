module Railsstrap
  module ModalHelper

    #modals have a header, a body, a footer for options.
    def modal_dialog(options = {}, &block)
      opts = default_modal_options.merge(options)
      content_tag :div, :id => opts[:id], :class => "railsstrap-modal modal #{opts['class']} fade" do
        content_tag :div, :class => "modal-dialog #{opts['size']}" do
          content_tag :div, :class => 'modal-content' do
            modal_header(opts[:header], &block) +
            modal_body(opts[:body], &block) +
            modal_footer(opts[:footer], &block)
          end
        end
      end
    end

    def modal_header(options, &block)
      content_tag :div, :class => 'modal-header' do
        if options[:show_close]
          close_button(options[:dismiss]) +
          content_tag(:h4, options[:title], :class => 'modal-title', &block)
        else
          content_tag(:h4, options[:title], :class => 'modal-title', &block)
        end
      end
    end

    def modal_body(options, &block)
      content_tag :div, options[:content], :class => 'modal-body', :style => options[:style], &block
    end

    def modal_footer(options, &block)
      content_tag :div, options[:content], :class => 'modal-footer', &block
    end

    def close_button(dismiss)
      content_tag :button, '&times;'.html_safe, :class => 'close', :data => {:dismiss => dismiss}, :'aria-hidden' => true
    end

    def modal_toggle(options = nil, &block)
      opts = { :content => 'Close', :class => 'btn btn-default', :data => { :toggle => 'modal'}, :href => options[:dialog] }.merge(options)
      content = opts[:content]
      opts.delete :content
      block_given? ? content_tag(:a, content, opts, true, &block) : content_tag(:a, content, opts, true)
    end

    def modal_cancel_button(content, options)
      default_opts = { :class => 'btn railsstrap-modal-cancel-button' }
      content_tag_string :a, content, default_opts.merge(options)
    end

    protected
    def default_modal_options
      {:id => 'modal', :size => '', :show_close => true, :dismiss => true}
    end

  end
end