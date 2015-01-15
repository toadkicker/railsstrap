module Railsstrap
  module AsideHelper

    #asides have a header, a body, a footer for options.
    def aside_dialog(options = {}, &block)
      opts = default_aside_options.merge(options)
      content_tag :div, :id => opts[:id], :class => "railsstrap-aside aside #{opts[:class]}", :data => { :backdrop => 'false' } do
        content_tag :div, :class => "aside-dialog #{opts['size']}" do
          content_tag :div, :class => 'aside-content' do
            aside_header(opts[:header], &block) +
            aside_body(opts[:body], &block) +
            aside_footer(opts[:footer], &block)
          end
        end
      end
    end

    def aside_header(options, &block)
      content_tag :div, :class => 'aside-header' do
        if options[:show_close]
          close_button(options[:dismiss]) +
          content_tag(:h4, options[:title], :class => 'aside-title', &block)
        else
          content_tag(:h4, options[:title], :class => 'aside-title', &block)
        end
      end
    end

    def aside_body(options, &block)
      content_tag :div, options[:content], :class => 'aside-body', :style => options[:style], &block
    end

    def aside_footer(options, &block)
      content_tag :div, options[:content], :class => 'aside-footer', &block
    end

    def close_button(dismiss)
      content_tag :button, '&times;'.html_safe, :class => 'close', :data => {:dismiss => dismiss}, :'aria-hidden' => true
    end

    def aside_toggle(options = nil, &block)
      opts = { :content => 'Close', :class => 'btn btn-default', :data => { :toggle => 'aside'}, :href => options[:dialog] }.merge(options)
      content = opts[:content]
      opts.delete :content
      block_given? ? content_tag(:a, content, opts, true, &block) : content_tag(:a, content, opts, true)
    end

    def aside_cancel_button(content, options)
      default_opts = { :class => 'btn railsstrap-aside-cancel-button' }
      content_tag_string :a, content, default_opts.merge(options)
    end

    protected
    def default_aside_options
      {:id => 'aside', :size => '', :show_close => true, :dismiss => true}
    end

  end
end