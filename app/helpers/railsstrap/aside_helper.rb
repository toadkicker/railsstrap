module Railsstrap
  module AsideHelper
    # asides have a header, a body, a footer for options.
    # <%= content_tag :a, "Open!", :href => "#aside", :class => 'btn', :data => {:toggle => 'modal'} %>
    # <%= aside_dialog id: "aside", class: 'left',
    #                  header: {show_close: true, dismiss: 'modal', title: 'Modal header', variant: 'success'},
    #                  body: {content: render('mypartial'), class: 'p-0'},
    #                  footer: {content: content_tag(:button, 'Save', class: 'btn'), variant: 'primary'} %>
    #
    #
    def aside_dialog(options = {}, &block)
      opts = default_aside_options.merge(options)
      content_tag :div, id: opts[:id], class: "aside #{opts[:class]}", data: { backdrop: 'true' } do
        content_tag :div, class: "aside-dialog #{opts['size']}" do
          content_tag :div, class: 'aside-content' do
            aside_header(opts[:header], &block) +
              aside_body(opts[:body], &block) +
              aside_footer(opts[:footer], &block)
          end
        end
      end
    end

    def aside_header(options, &block)
      content_tag :div, class: "aside-header #{options[:variant]}" do
        if options[:show_close]
          content_tag(:h5, options[:title], class: "aside-title", &block) +
            close_button(options[:dismiss])
        else
          content_tag(:h5, options[:title], class: "aside-title", &block)
        end
      end
    end

    def aside_body(options, &block)
      content_tag :div, options[:content], class: "aside-body #{options[:class]}", style: options[:style], &block
    end

    def aside_footer(options, &block)
      content_tag :div, options[:content], class: "aside-footer #{options[:variant]}", &block
    end

    def close_button(dismiss = true)
      content_tag :button, content_tag(:span, '&times;'.html_safe, 'aria-hidden': true), class: 'close', data: { dismiss: dismiss }, 'aria-label': 'Close'
    end

    def aside_toggle(options = {}, &block)
      opts = { content: 'Close', class: 'btn btn-default', data: { toggle: 'modal' }, href: options[:dialog] }.merge(options)
      content = opts[:content]
      opts.delete :content
      block_given? ? content_tag(:a, content, opts, true, &block) : content_tag(:a, content, opts, true)
    end

    def aside_cancel_button(content, options)
      default_opts = { class: "btn #{'btn-' + options[:variant] if options[:variant].present?} cancel-button" }
      content_tag_string :a, content, default_opts.merge(options)
    end

    protected

    def default_aside_options
      { id: 'aside', size: '', show_close: true, backdrop: true }
    end
  end
end