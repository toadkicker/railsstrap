require 'railsstrap/classes/base'

module Railsstrap
  module Classes
    class Breadcrumbs < Base
      def ensure_root_breadcrumb!
        @options[:items] ||= [{:title => 'Home', :url => '/'}]
      end

      def add_breadcrumb(title, url)
        @options[:items] << {:title => title, :url => url}
      end

    end
  end
end
