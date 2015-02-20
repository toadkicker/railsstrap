require 'railsstrap/classes/base'
module Railsstrap
  module Classes
    class Breadcrumb < Base
      def add_breadcrumb(name, url = '', options = {})
        options.merge! :klass => self.name
        before_filter options do |controller|
          controller.send :add_breadcrumb, name, url, options
        end
      end
    end
  end
end
