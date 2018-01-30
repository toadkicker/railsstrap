# frozen_string_literal: true

require 'rails/generators'

module Railsstrap
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Generates a layout file with navigation.'
      argument :layout_name, type: :string, default: 'application'

      attr_reader :app_name

      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split('::').first
        ext = app.config.generators.options[:rails][:template_extension] || :erb
        template "layout.html.#{ext}", "app/views/layouts/#{layout_name}.html.#{ext}"
      end
    end
  end
end
