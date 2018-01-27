# frozen_string_literal: true

shared_examples_for 'the navbar helper' do
  all_tests_pass_with 'no navbar options'
  all_tests_pass_with 'the :fluid navbar option'
  all_tests_pass_with 'the :variant navbar option'
  all_tests_pass_with 'the :text_variant navbar option'
  all_tests_pass_with 'the :position navbar option'
  all_tests_pass_with 'the :padding navbar option'
end

#--

shared_examples_for 'no navbar options' do
  specify 'creates a <nav> element with a nested container' do
    html = <<-EOT.strip_heredoc.strip
      <nav class="navbar bg-primary navbar-expand-lg navbar-dark" role="navigation">
        <div class="container">
          content
        </div>
      </nav>
    EOT
    expect(:navbar).to generate html
  end
end

shared_examples_for 'the :fluid navbar option' do
  Railsstrap::Navbar.layouts.each do |value, fluid_class|
    specify %(set to #{value}, sets the class "#{fluid_class}") do
      html = /<div class="#{fluid_class}">/
      expect(navbar: { fluid: value }).to generate html
    end
  end
end

shared_examples_for 'the :variant navbar option' do
  Railsstrap::Navbar.variants.each do |value, variant_class|
    specify %(set to #{value}, sets the class "#{variant_class}") do
      html = /<nav class="navbar #{variant_class}.+/
      expect(navbar: { variant: value }).to generate html
    end
  end
end

shared_examples_for 'the :text_variant navbar option' do
  Railsstrap::Navbar.text_variants.each do |value, variant_class|
    specify %(set to #{value}, sets the class "#{variant_class}") do
      html = /.+?class="navbar.*?#{variant_class}.*?"/
      expect(navbar: { variant: value }).to generate html
    end
  end
end

shared_examples_for 'the :position navbar option' do
  Railsstrap::Navbar.positions.each do |position, position_class|
    specify %(set to #{position}, sets the class "#{position_class}") do
      html = /.*class=".+#{position_class}".*/
      expect(navbar: { position: position }).to generate html
    end
  end
end

shared_examples_for 'the :padding navbar option' do
  %i[top bottom].each do |position|
    specify %(set to a value, uses that value for #{position} position) do
      html = %r{<style>body {padding-#{position}: 100px}</style>}m
      expect(navbar: { position: position, padding: 100 }).to generate html
    end

    specify %(not set, uses a default value of 70px for #{position} position) do
      html = %r{<style>body {padding-#{position}: 70px}</style>}m
      expect(navbar: { position: position }).to generate html
    end
  end
end
