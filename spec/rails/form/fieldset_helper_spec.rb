require 'rails_helper'
require 'railsstrap/core_ext/rails/form_for_helper'
include Railsstrap::Rails::Helpers

describe 'fieldset' do
  let(:protect_against_forgery?) { false }
  let(:form) { form_for User.new, layout: layout, url: '/', &block }
  let(:block) { Proc.new {|f| f.fieldset title, &fieldset_block } }
  let(:title) { nil }
  let(:fieldset_block) { Proc.new { 'fieldset content' } }
  let(:layout) { :whatever }

  specify 'adds a <fieldset> that looks like a Bootstrap card' do
    expect(form).to include 'fieldset class="card">'
  end

  context 'given a title, and a non-inline layout, adds the title in the card heading' do
    let(:title) { 'Info' }
    it { expect(form).to include '<div class="card-title">Info</div>' }
  end

  context 'given a title, and an inline layout, does not add a card heading' do
    let(:layout) { :inline }
    let(:title) { 'Info' }
    it { expect(form).not_to include '<div class="card-heading">Info</div>' }
  end

  context 'not given a title, does not add a card heading' do
    let(:title) { '' }
    it { expect(form).not_to include 'card-heading' }
  end
end