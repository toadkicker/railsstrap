shared_examples_for 'the bootstrap_css helper' do
  it { expect(:bootstrap_css).to link_to_existing_file }
end

shared_examples_for 'the bootstrap_theme_css helper' do
  it { expect(:bootstrap_theme_css).to link_to_existing_file }
end

shared_examples_for 'the bootstrap_js helper' do
  it { expect(:bootstrap_js).to link_to_existing_file }
end

shared_examples_for 'the font_awesome_css helper' do
  it { expect(:font_awesome_css).to link_to_existing_file }
end

shared_examples_for 'the railsstrap_css helper' do
  it { expect(:railsstrap_css).to link_to_existing_file }
end

shared_examples_for 'the bootstrap_additions_css helper' do
  it { expect(:bootstrap_additions_css).to link_to_existing_file }
end

shared_examples_for 'the datepicker_css helper' do
  it { expect(:datepicker_css).to link_to_existing_file }
end

shared_examples_for 'the datepicker_js helper' do
  it { expect(:datepicker_js).to link_to_existing_file }
end
#--

RSpec::Matchers.define :link_to_existing_file do
  match do |helper|
    require 'open-uri'
    open_uri_options = {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}

    # via HTTP
    open railsstrap.send(helper, scheme: :http), open_uri_options

    # via HTTPS
    open railsstrap.send(helper, scheme: :https), open_uri_options

    # non-minified
    open railsstrap.send(helper, scheme: :http, minified: false), open_uri_options

    # legacy version
    open railsstrap.send(helper, scheme: :http, version: '3.1.0'), open_uri_options
  end
end