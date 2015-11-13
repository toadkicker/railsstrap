$:.push File.expand_path('../lib', __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
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
  s.required_ruby_version = '>= 1.9.3'

  s.files = `git ls-files`.split($/)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib", "vendor"]

  s.add_dependency 'activesupport'          # versioned in gemfiles/
  s.add_dependency 'actionpack'             # versioned in gemfiles/


  # For development / Code coverage / Documentation
  s.add_development_dependency 'bundler', '~> 1.1'
  s.add_development_dependency 'minitest', '~> 5.6.0'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rspec-html-matchers', '~> 0.7.0'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'yard', '~> 0.8.7'
  s.add_development_dependency 'coveralls', '~> 0.7.1'
  s.add_development_dependency 'activemodel' # versioned in gemfiles/

  # For spec/dummy
  s.add_development_dependency 'middleman-core' # versioned in gemfiles/

  # For Middleman/Padrino tests
  s.add_development_dependency 'padrino-helpers', '~> 0.12'
  s.add_development_dependency 'padrino-routing', '~> 0.5'

  # For compiling LESS files
  s.add_dependency 'less-rails', '~> 2.5'

  if Gem::Platform::RUBY === 'jruby'
    s.add_runtime_dependency 'therubyrhino'
  else
    s.add_runtime_dependency 'therubyracer', '~> 0.10'
  end
end
