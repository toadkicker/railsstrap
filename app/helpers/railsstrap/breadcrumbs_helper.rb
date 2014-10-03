module Railsstrap
  module BreadcrumbsHelper
    #TODO: make divider optional
    def render_breadcrumbs(divider = '/', options={}, &block)
      default_options = { :class => '', :item_class => '', :divider_class => '', :active_class => 'active' }.merge(options)
      #TODO: is default_options merged in and then unused?
      content = render :partial => 'railsstrap/breadcrumbs', :layout => false, :locals => { :divider => divider, options: options }
      if block_given?
        capture(content, &block)
      else
        content
      end
    end
  end
end