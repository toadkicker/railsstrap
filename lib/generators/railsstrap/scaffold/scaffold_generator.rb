# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/generated_attribute'

module Railsstrap
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      protected

      def format
        :html
      end

      def handler
        :erb
      end
    end

    class ScaffoldGenerator < Base # :nodoc:
      include ::Rails::Generators::ResourceHelpers

      source_root File.expand_path('../templates', __FILE__)
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      class_option :excluded_columns, type: :array, required: false

      def initialize(args, *options)
        super(args, *options)
        initialize_views_variables
      end

      def initialize_views_variables
        @base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules
        @controller_routing_path = @controller_file_path.gsub(/\//, '_')
        @resource_name ||= @controller_class_nesting + "::#{@base_name.singularize.camelize}"
        @resource_name = @resource_name.camelize
        @model_name = @resource_name.downcase.gsub('::', '')
      end

      attr_reader :resource_name

      def excluded_columns_pattern
        [
          /.*_checksum/,
          /.*_count/,
        ]
      end

      def excluded_columns
        options['excluded_columns'] || []
      end

      def rescue_block(exception = Exception)
        yield if block_given?
      rescue exception => e
        say e.message, :red
        exit
      end

      def extract_modules
        modules = controller_name.include?('/') ? controller_name.split('/') : controller_name.split('::')
        name = modules.pop
        path = modules.map(&:underscore)
        file_path = (path + [name.underscore]).join('/')
        nesting = modules.map(&:camelize).join('::')
        [name, path, file_path, nesting, modules.size]
      end

      def copy_views
        generate_views
      end

      def generate_views
        options.engine == generate_erb
      end

      def selected_views
        {
          "index.html.#{ext}" => File.join('app/views', @controller_file_path, "index.html.#{ext}"),
          "new.html.#{ext}" => File.join('app/views', @controller_file_path, "new.html.#{ext}"),
          "edit.html.#{ext}" => File.join('app/views', @controller_file_path, "edit.html.#{ext}"),
          "#{form_builder}_form.html.#{ext}" => File.join('app/views', @controller_file_path, "_form.html.#{ext}"),
          "show.html.#{ext}" => File.join('app/views', @controller_file_path, "show.html.#{ext}")
        }
      end

      def generate_erb
        selected_views.each do |template_name, output_path|
          template template_name, output_path
        end
      end

      def ext
        ::Rails.application.config.generators.options[:rails][:template_extension] || :erb
      end

      def form_builder
        defined?(::SimpleForm) ? 'simple_form/' : ''
      end
    end
  end
end
