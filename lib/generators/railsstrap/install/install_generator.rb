require 'rails/generators'

module Railsstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc 'This generator installs Bootstrap to Asset Pipeline'
      argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'
      class_option :'no-coffeescript', :type => :boolean, :default => false, :desc => 'Skips coffeescript replacement into app generators'

      def add_assets

        js_manifest = 'app/assets/javascripts/application.js'
        css_manifest = 'app/assets/stylesheets/application.css'
        asset_initializer = 'config/initializers/assets.rb'
        config_asset_insert_line = "Rails.application.config.assets.precompile\s+=\s%w(\sbootstrap/fonts/glyphicons-halflings-regular.eot\sbootstrap/fonts/glyphicons-halflings-regular.svg\sbootstrap/fonts/glyphicons-halflings-regular.ttf\sbootstrap/fonts/glyphicons-halflings-regular.woff\sfontawesome/fonts/fontawesome-webfont.eot\sfontawesome/fonts/fontawesome-webfont.woff\sfontawesome/fonts/fontawesome-webfont.ttf\sfontawesome/fonts/fontawesome-webfont.svg\s)"

        if File.exists?(asset_initializer) && Rails::VERSION::MAJOR >= 4 #Must be Rails 4
          content = File.read(asset_initializer)
          if content.match(config_asset_insert_line)
            #set up properly
            puts "Ensure config/initializers/assets.rb contains this line:\n" + config_asset_insert_line
          else
            insert_into_file asset_initializer, config_asset_insert_line, :after => 'config.assets.precompile\n'
          end
        else #Assumes Rails 3.1 then...
          rails_three_config = 'config/environments/production.rb'
          if File.exists?(rails_three_config) && Rails::VERSION::MAJOR <= 4
            insert_into_file rails_three_config, config_asset_insert_line, :after => 'config.assets.precompile\n'
          end
        end

        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require bootstrap/dist/js/bootstrap\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", js_manifest
        end

        if File.exist?(css_manifest)
          # Add our own require:
          content = File.read(css_manifest)

          if content.match(/require_tree\s+\.\s*$/)
            # Good enough - that'll include our bootstrap_and_overrides.css.less
          else
            style_require_block = " *= require bootstrap_and_overrides\n"
            insert_into_file css_manifest, style_require_block, :after => "require_self\n"
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end

      end

      def add_bootstrap
        if use_coffeescript?
          copy_file "bootstrap.coffee", "app/assets/javascripts/bootstrap.js.coffee"
        else
          copy_file "bootstrap.js", "app/assets/javascripts/bootstrap.js"
        end
        if use_less?
          copy_file "bootstrap_and_overrides.less", "app/assets/stylesheets/bootstrap_and_overrides.css.less"
        else
          copy_file "bootstrap_and_overrides.css", "app/assets/stylesheets/bootstrap_and_overrides.css"
        end
      end

      def add_locale
        if File.exist?("config/locales/en.railsstrap.yml")
          localez = File.read("config/locales/en.railsstrap.yml")
          insert_into_file "config/locales/en.railsstrap.yml", localez, :after => "en\n"
        else
          copy_file "en.railsstrap.yml", "config/locales/en.railsstrap.yml"
        end
      end

      def cleanup_legacy
        # Remove old requires (if any) that included railsstrap/railsstrap directly:
        gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*bootstrap/bootstrap\s*\n|, "")
        if File.exist?('app/assets/stylesheets/bootstrap_override.css.less')
          puts <<-EOM
          Warning:
            app/assets/stylesheets/bootstrap_override.css.less exists
            It should be removed, as it has been superceded by app/assets/stylesheets/bootstrap_and_overrides.css.less
          EOM
        end
      end

    private
      def use_less?
        (defined?(Less) && (stylesheets_type!='static') ) || (stylesheets_type=='less')
      end

      def use_coffeescript?
        return false if options[:'no-coffeescript']
        ::Rails.configuration.app_generators.rails[:javascript_engine] == :coffee
      end
    end
  end
end
