module Railsstrap
  module Extensions
    # Makes Bootstrap helpers available in Padrino applications.
    #
    # To use Railsstrap in a Padrino app you need 2 steps:
    #
    #   - include railsstrap in the Gemfile
    #   - add `register Railsstrap` in the `app.rb` file
    #
    # The following method adds `Railsstrap` as one of the modules that can be registered
    # in a Padrino app, but you still need to register it manually in order to
    # make helpers available.
    module Padrino
      # Register Railsstrap as a Padrino app.
      def registered(app)
        app.include Railsstrap::Helpers
      end
    end

    Railsstrap.framework = :padrino
  end

  # Allows to register Railsstrap in a Padrino app simply with `register Railsstrap`.
  extend Extensions::Padrino
end