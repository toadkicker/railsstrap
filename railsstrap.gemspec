$:.push File.expand_path('../lib', __FILE__)
require 'railsstrap/constants'

Gem::Specification.new do |s|
  s.name        = 'railsstrap'
  s.version     = Railsstrap::Constants::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Todd Baur']
  s.email       = ['todd@toadkicker.com']
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/toadkicker/railsstrap'
  s.summary     = %q{Bootstrap CSS toolkit for Rails 3.1+ Asset Pipeline}
  s.description = %q{Make rails and bootstrap sing with awesome helpers, additional components, and more.}

  s.rubyforge_project = 'railsstrap'
  s.files = Dir['lib/**/*'] + Dir['vendor/**/*'] + Dir['app/**/*'] + %w(Rakefile README.md .bowerrc)
  s.test_files    = Dir['spec/**/*.rb']
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = %w(lib app vendor)

  s.add_dependency         'actionpack', '>= 3.1'
  s.add_dependency         'less-rails', '>= 2.5.0', :path => ENV['LESS_RAILS_SOURCE'] if ENV['LESS_RAILS_SOURCE']

  s.add_development_dependency 'capybara', '~> 2.2.1'
  s.add_development_dependency 'sqlite3', '~> 1.3.8'

  s.add_development_dependency 'jquery-rails',   '~> 3.1.0'

  s.add_development_dependency 'better_errors',     '~> 1.1.0'
  s.add_development_dependency 'binding_of_caller', '~> 0.7.2'
  s.add_development_dependency 'rb-readline'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-html-matchers'
  s.add_development_dependency 'rspec-activemodel-mocks'

  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rake'

  if Gem::Platform::RUBY === 'jruby'
    s.add_runtime_dependency 'therubyrhino'
  else
    s.add_runtime_dependency 'therubyracer'
  end
end
