require 'railsstrap/classes/breadcrumb'

module Railsstrap
  module Rails
    module Helpers

      def add_breadcrumb(name, url = '', options = {})
        @breadcrumbs ||= []

        class_name = options.delete(:klass) || self.class.name

        if name.is_a? Symbol
          if url.blank?
            url_helper = :"#{name}_path"
            url = url_helper if respond_to?(url_helper)
          end

          name = translate_breadcrumb name, class_name
        end

        unless name.is_a? String
          url = polymorphic_path name if url.blank?
          name = name.to_s
        end

        url = eval(url.to_s) if url.is_a?(Symbol) && url =~ /_path|_url|@/

        @breadcrumbs << {:name => name, :url => url, :options => options}
      end

      def translate_breadcrumb(name, class_name)
        scope = [:breadcrumbs]
        namespace = class_name.underscore.split('/')
        namespace.last.sub!('_controller', '')
        scope += namespace

        I18n.t name, :scope => scope
      end

      def render_breadcrumbs(divider = '/', options={}, &block)
        opts = {:class => '', :item_class => '', :divider_class => '', :active_class => 'active'}.merge(options)
        content = render_partial 'railsstrap/breadcrumbs', :layout => false, :locals => {:divider => divider, options: opts}
        if block_given?
          capture(content, &block)
        else
          content
        end
      end
    end
  end
end