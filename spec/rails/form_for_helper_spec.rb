require 'rails_helper'
require 'railsstrap/core_ext/rails/form_for_helper'
include Railsstrap::Rails::Helpers

describe 'form_for' do
  let(:railsstrap) { RailsView.new }
  let(:protect_against_forgery?) { false }
  attr_accessor :output_buffer
  let(:form) { form_for(:object, options.merge(url: '/')) {} }
  let(:options) { {} }

  specify 'by default, does not apply Bootstrap attributes to the form' do
    expect(form).not_to include 'role="form"'
  end

  specify 'wrapped in navbar, applies Bootstrap attributes of a navbar form' do
    railsstrap.navbar { expect(form).to include 'role="form"' }
    railsstrap.navbar { expect(form).to include 'class="form-inline"' }
  end

  specify 'wrapped in nav, surrounds the form in a <li> item' do
    railsstrap.nav { expect(form).to match %r{^<li><form.+?</form></li>$} }
  end

  describe 'with layout: :inline' do
    let(:options) { {layout: :inline} }

    specify 'applies Bootstrap attributes of an inline form' do
      expect(form).to include 'role="form"'
      expect(form).to include 'class="form-inline"'
    end
  end

  describe 'with any other value for :layout' do
    let(:options) { {layout: :basic} }

    specify 'applies Bootstrap attributes of a basic form' do
      expect(form).to include 'role="form"'
    end
  end
end