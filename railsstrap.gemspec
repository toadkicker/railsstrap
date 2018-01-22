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
  s.summary = %q{Bootstrap CSS toolkit for Rails 3.1+ Asset Pipeline}
  s.description = %q{Make rails and bootstrap sing with awesome helpers, additional components, and more.}

  s.rubyforge_project = 'railsstrap'
  s.files = Dir['lib/**/*'] + Dir['vendor/**/*'] + Dir['app/**/*'] + %w(Rakefile README.md .bowerrc)
  s.test_files = Dir['spec/**/*.rb']
  s.executables = `git ls-files -- bin/*`.split('\n').map {|f| File.basename(f)}
  s.require_paths = %w(lib app vendor)

  s.add_dependency 'actionpack', '>= 3.1'
  s.add_dependency 'bootstrap', '>= 4.0'

  s.add_development_dependency 'capybara', '~> 2.2.1'

  s.add_development_dependency 'jquery-rails', '~> 3.1.0'

  if Gem::ruby_engine != 'jruby'
    s.add_development_dependency 'better_errors', '~> 1.1.0'
    s.add_development_dependency 'binding_of_caller', '~> 0.7.2'
    s.add_development_dependency 'rb-readline'

    s.add_development_dependency 'guard'
    s.add_development_dependency 'guard-rspec'
  end

  s.add_development_dependency 'pry'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-activemodel-mocks'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rake'

  if Gem::ruby_engine == 'jruby'
    s.add_runtime_dependency 'therubyrhino'
  else
    s.add_runtime_dependency 'therubyracer'
  end
end
