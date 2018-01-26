require 'railsstrap/classes/breadcrumbs'

module Railsstrap
  module Helpers
    def breadcrumbs(*args, &block)
      breadcrumbs = Railsstrap::Classes::Breadcrumbs.new(*args, &block)
      breadcrumbs.ensure_root_breadcrumb!
      breadcrumbs.extract! :class, :item_class, :item
      breadcrumbs.render_partial 'breadcrumbs'
    end
  end
end

