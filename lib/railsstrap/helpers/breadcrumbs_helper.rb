module Railsstrap
  module Helpers
    #TODO: make divider optional
    def render_breadcrumbs(divider = '/', options={}, &block)
      { :class => '', :item_class => '', :divider_class => '', :active_class => 'active' }.merge(options)
      content = render :partial => 'railsstrap/breadcrumbs', :layout => false, :locals => { :divider => divider, options: options }
      if block_given?
        capture(content, &block)
      else
        content
      end
    end
  end
end