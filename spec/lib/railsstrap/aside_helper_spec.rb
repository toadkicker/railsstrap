module AsideHelper

  #asides have a header, a body, a footer for options.
  def aside_dialog(options = {}, &block)
    opts = default_aside_options.merge(options)
    content_tag :div, :id => opts[:id], :class => "aside collapse #{opts[:side]}", :data => {:backdrop => 'false'} do
      content_tag :div, :class => "aside-dialog #{opts['size']}" do
        content_tag :div, :class => 'aside-content' do
          aside_header(opts[:header], &block) +
              aside_body(opts[:body], &block) +
              aside_footer(opts[:footer], &block)
        end
      end
    end
  end

  def aside_header(options = {}, &block)
    content_tag :div, :class => 'aside-header' do
      if options[:show_close]
        close_button +
            content_tag(:h4, options[:title], :class => 'aside-title mb-0', &block)
      else
        content_tag(:h4, options[:title], :class => 'aside-title', &block)
      end
    end
  end

  def aside_body(options = {}, &block)
    content_tag :div, options[:content] || "Default", :class => 'aside-body', :style => options[:style], &block
  end

  def aside_footer(options = {}, &block)
    content_tag :div, options[:content], :class => 'aside-footer', &block
  end

  def close_button(options = {target: '#aside'})
    content_tag :button, '&times;'.html_safe, class: 'close', data: {toggle: 'collapse', target: options[:target]}, aria: {hidden: true}
  end

  def aside_toggle(options = {}, &block)
    opts = {content: close, class: 'btn btn-default', data: {toggle: 'modal', target: '#aside'}, href: options[:dialog]}.merge(options)
    content = opts[:content]
    opts.delete :content
    block_given? ? content_tag(:a, content, opts, true, &block) : content_tag(:a, content, opts, true)
  end

  def navbar_toggler(options = {})
    content_tag :button, class: 'navbar-toggler', type: 'button', data: {toggle: 'collapse', target: options[:target]}, aria: {controls: options[:target], label: options[:label]} do
      content_tag :span, '', class: 'navbar-toggler-icon'
    end
  end

  def aside_cancel_button(content = "Default", options = {})
    default_opts = {class: 'btn aside-cancel-button'}
    content_tag_string :a, content, default_opts.merge(options)
  end

  def aside_script(options = {id: "#aside", show: false})
    javascript_tag do
      "$('#{options[:id]}').modal({show: #{options[:show]})"
    end
  end

  protected
  def default_aside_options
    {id: 'aside', side: 'left', show_close: true}
  end

end