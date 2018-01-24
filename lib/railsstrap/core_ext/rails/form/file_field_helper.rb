require 'railsstrap/core_ext/rails/form/base_helper'

module Railsstrap
  module Form
    module FileFieldHelper
      include BaseHelper

      def file_field(method, options={})
        base_field method, :file, options do
          super method, options
        end
      end
    end
  end
end