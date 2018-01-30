require 'railsstrap/classes/button'
require 'railsstrap/classes/button_group'

module Railsstrap
  module Helpers
    #Displays a Bootstrap-styled button group or toolbar.
    # @see http://getbootstrap.com/docs/4.0/components/button-group
    # @return [String] the HTML to display a Bootstrap-styled button.
    # @overload button_group(caption, options = {})
    #   @param [#to_s] caption the buttons for the group
    #   @option options [#to_s] :toolbar creates a div.btn-toolbar
    #   @option options [#to_s] :role (:group) Sets the role attribute
    #   @option options [#to_s] :size the size of the button group. Specifying
    #     size here causes the inner buttons to match this size. Buttons cannot
    #     be different sizes inside a group.
    #   @option options [#to_s] :vertical orient the button group vertically.
    #   @example Display a button group
    #       button_group size: :lg, do
    #         button caption, options
    #         button caption, options
    #       end
    def button_group(*args, &block)
      btn_group = Railsstrap::ButtonGroup.new(self, *args, &block)
      btn_group.extract! :group, :toolbar, :role, :size, :vertical

      btn_group.append_class! 'btn-group'
      btn_group.append_class! btn_group.vertical_class
      btn_group.append_class! btn_group.size_class
      btn_group.append_class! btn_group.toolbar_class
      btn_group.merge! btn_group.role_name
      btn_group.content_tag :div
    end
  end
end