module Railsstrap
  # @api private
  # Provides methods to register Railsstrap in third-party applications.
  module Extensions
    # Makes Bootstrap helpers available in Middleman applications.
    #
    # To use Railsstrap in a Middleman app you need 2 steps:
    #
    #   - include railsstrap in the Gemfile
    #   - add `activate :railsstrap` in the `config.rb` file
    #
    # The following class is registered as a Middleman extension, but you still
    # need to activate it in the configuration file to make helpers available.
    class MiddlemanExtension < Middleman::Extension
      helpers do
        include Railsstrap::Helpers
      end
    end
  end

  Railsstrap.framework = :middleman
end

::Middleman::Extensions.register(:railsstrap, Railsstrap::Extensions::MiddlemanExtension)