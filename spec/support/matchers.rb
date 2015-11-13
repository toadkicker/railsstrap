RSpec::Matchers.define :generate do |html|
  match do |helper, options = nil|
    if helper.is_a?(Hash)
      helper, options = helper.keys.first, helper.values.first
    end

    if helper == :link_to && options == :nil_name
      @inline = railsstrap.send helper, nil, '/'
      @block = @inline
    elsif helper == :link_to && options == :xss_script
      @inline = railsstrap.send helper, '<script>alert("xss")</script>', '/'
      @block = railsstrap.send(helper, '/') { '<script>alert("xss")</script>' }
    elsif helper == :link_to && options == :safe_html
      @inline = railsstrap.send helper, railsstrap.tag(:hr), '/'
      @block = railsstrap.send(helper, '/') { railsstrap.tag(:hr) }
    elsif helper == :link_to || helper == :button_to
      @inline = railsstrap.send helper, *['content', '/', options].compact
      if railsstrap.test_button_to_with_block
        @block = railsstrap.send(helper, *['/', options].compact) { 'content' }
      else
        @block = @inline
      end
    elsif helper == :dropdown
      @block = railsstrap.send(helper, *['caption', options].compact) { 'content' }
      @inline = @block
    elsif helper == :glyphicon || helper == :icon
      @inline = railsstrap.send helper, *['zoom-in', options].compact
      @block = railsstrap.send helper, *[:zoom_in, options].compact
    elsif helper == :progress_bar
      @inline = railsstrap.send helper, *Array.wrap(options)
      @block = @inline
    elsif helper == :navbar || helper == :nav || helper == :panel_row
      @block = railsstrap.send(helper, *[options].compact) { 'content' }
      @inline = @block
    else
      @inline = railsstrap.send helper, *['content', options].compact
      @block = railsstrap.send(helper, *[options].compact) { 'content' }
    end

    case html
      when Regexp then @inline.match(html) && @block.match(html)
      else @inline.eql?(html) && @block.eql?(html)
    end
  end

  failure_message{|actual| "expected #{html}, got #{@inline} and #{@block}"}
end