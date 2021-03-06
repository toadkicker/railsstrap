# frozen_string_literal: true

require 'rails/generators'

module Railsstrap
  module Generators
    class PartialGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Generates railsstrap HTML partials'
      argument :component_name, type: :string, default: 'application',
               banner: 'navbar, navbar-devise, carousel'

      attr_reader :app_name

      def generate_partial
        app = ::Rails.application
        ext = app.config.generators.options[:rails][:template_engine] || :erb
        copy_file "_#{component_name}.html.#{ext}", "app/views/shared/_#{component_name}.html.#{ext}"
      end
    end
  end
end
