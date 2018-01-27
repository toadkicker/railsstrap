$:.push File.expand_path('../lib', __FILE__)
require 'railsstrap/version'

Gem::Specification.new do |s|
  s.name = 'railsstrap'
  s.version = Railsstrap::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Todd Baur']
  s.email = ['todd@toadkicker.com']
  s.license = 'MIT'
  s.homepage = 'https://github.com/toadkicker/railsstrap'
  s.summary = %q{Bootstrap 4 for Ruby}
  s.description = %q{Make your ruby project awesomer with template helpers, additional components, and more.}

  s.rubyforge_project = 'railsstrap'
  s.files = Dir['lib/**/*'] + Dir['vendor/**/*'] + ['node_modules/**/*']
  s.test_files = Dir['spec/**/*.rb']
  s.executables = `git ls-files -- bin/*`.split('\n').map {|f| File.basename(f)}
  s.require_paths = %w(lib node_modules vendor)

  s.add_dependency 'actionpack' # versioned in gemfiles/
  s.add_dependency 'activesupport' # versioned in gemfiles/
  s.add_dependency 'bootstrap', '>= 4.0'
  s.add_dependency 'jquery-rails'

  if Gem::ruby_engine != 'jruby'
    s.add_development_dependency 'better_errors', '~> 1.1.0'
    s.add_development_dependency 'binding_of_caller', '~> 0.7.2'
    s.add_development_dependency 'rb-readline'

    s.add_development_dependency 'guard'
    s.add_development_dependency 'guard-rspec'
  end

  s.add_development_dependency 'activemodel' # versioned in gemfiles/
  s.add_development_dependency 'bundler', '~> 1.1'
  s.add_development_dependency 'simplecov', '~> 0.14.1'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'mocha'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'tilt'
  s.add_development_dependency 'yard'
  s.metadata["yard.run"] = "yri"

  unless ENV['ONLY_RAILS']
    # For spec/dummy
    s.add_development_dependency 'middleman-core' # versioned in gemfiles/

    # For Middleman/Padrino tests
    s.add_development_dependency 'padrino-helpers', '~> 0.12.4'
    s.add_development_dependency 'padrino-routing', '~> 0.5.0'
  end

end
