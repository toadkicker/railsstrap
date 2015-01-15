# encoding: utf-8
require 'spec_helper'
require_relative '../../../app/helpers/railsstrap/aside_helper'

include ActionView::Helpers
include ActionView::Context
include Railsstrap::AsideHelper

describe Railsstrap::AsideHelper, :type => :helper do
  header_with_close = {:show_close => true, :dismiss => 'aside', :title => 'Aside header'}
  header_without_close = {:show_close => false, :title => 'Aside header'}
  options = {:id => "aside",
             :header => header_with_close,
             :body => {content: 'This is the body'},
             :footer => {content: content_tag(:button, 'Save', :class => 'btn')}
  }

  it 'returns a complete aside' do
    expect(aside_dialog(options).gsub(/\s/, '')).to eql BASIC_ASIDE.gsub(/\s/, '')
  end

  it 'returns a left aside' do
    options[:class] = 'left'
    expect(aside_dialog(options).gsub(/\s/, '')).to eql LEFT_ASIDE.gsub(/\s/, '')
  end

  it 'returns a aside header with a close button if show_close is true' do
    expect(aside_header(header_with_close).gsub(/\s/, '')).to eql ASIDE_HEADER_WITH_CLOSE.gsub(/\s/, '')
  end

  it 'renders a aside header without a close button' do
    expect(aside_header(header_without_close).gsub(/\s/, '')).to eql ASIDE_HEADER_WITHOUT_CLOSE.gsub(/\s/, '')
  end

  it 'renders a aside body' do
    expect(aside_body(options[:body]).gsub(/\s/, '')).to eql ASIDE_BODY.gsub(/\s/, '')
  end

  it 'renders a aside footer' do
    expect(aside_footer(options[:footer]).gsub(/\s/, '')).to eql ASIDE_FOOTER.gsub(/\s/, '')
  end

  it 'renders a close button' do
    expect(close_button('aside')).to eql ASIDE_CLOSE_BUTTON.gsub(/\n/, '')
  end

  it 'renders a aside toggle button' do
    expect(aside_toggle(:content => 'Save', :href => "#aside").gsub(/\s/, '')).to eql ASIDE_TOGGLE.gsub(/\s/, '')
  end

  it 'renders a aside toggle button with options changed' do
    expect(aside_toggle(:content => 'Save', :href => "#aside", :data => {:foo => true, :toggle => 'aside'}).gsub(/\s/, '')).to eql ASIDE_TOGGLE_OPTS.gsub(/\s/, '')
  end

  it 'renders a aside toggle button with a block given' do
    expect(aside_toggle(:href => "#aside", :data => {:foo => true, :toggle => 'aside'}){ content_tag(:span, 'Blocks Rock', class: "i-added-you") }.gsub(/\s/, '')).to eql ASIDE_TOGGLE_BLOCK.gsub(/\s/, '')
  end

  it 'renders a cancel button' do
    expect(aside_cancel_button('Cancel', :href => "#aside", :data => {:dismiss => 'aside'}).gsub(/\s/, '')).to eql ASIDE_CANCEL_BUTTON.gsub(/\s/, '')
  end
end

BASIC_ASIDE = <<-HTML
<div id="aside" class="railsstrap-aside aside" data-backdrop="false">
  <div class="aside-dialog ">
    <div class="aside-content">
      <div class="aside-header">
        <button class="close" data-dismiss="aside" aria-hidden="true">&times;</button>
        <h4 class="aside-title">Aside header</h4>
      </div>
      <div class="aside-body">This is the body</div>
      <div class="aside-footer">
        <button class="btn">Save</button>
      </div>
    </div>
  </div>
</div>
HTML

LEFT_ASIDE = <<-HTML
<div id="aside" class="railsstrap-aside aside left" data-backdrop="false">
  <div class="aside-dialog ">
    <div class="aside-content">
      <div class="aside-header">
        <button class="close" data-dismiss="aside" aria-hidden="true">&times;</button>
        <h4 class="aside-title">Aside header</h4>
      </div>
      <div class="aside-body">This is the body</div>
      <div class="aside-footer">
        <button class="btn">Save</button>
      </div>
    </div>
  </div>
</div>
HTML

ASIDE_BODY = <<-HTML
<div class="aside-body">This is the body</div>
HTML

ASIDE_FOOTER = <<-HTML
<div class="aside-footer"><button class="btn">Save</button></div>
HTML

ASIDE_HEADER_WITHOUT_CLOSE = <<-HTML
<div class="aside-header"><h4 class="aside-title">Aside header</h4></div>
HTML

ASIDE_HEADER_WITH_CLOSE = <<-HTML
<div class="aside-header">
  <button class="close" data-dismiss="aside" aria-hidden="true">&times;</button>
  <h4 class="aside-title">Aside header</h4>
</div>
HTML

ASIDE_TOGGLE = <<-HTML
<a class="btn btn-default" data-toggle="aside" href="#aside">Save</a>
HTML

ASIDE_TOGGLE_OPTS = <<-HTML
<a class="btn btn-default" data-foo="true" data-toggle="aside" href="#aside">Save</a>
HTML

ASIDE_TOGGLE_BLOCK = <<-HTML
<a class="btn btn-default" data-foo="true" data-toggle="aside" href="#aside">
  <span class="i-added-you">
    Blocks Rock
  </span>
</a>
HTML

ASIDE_CANCEL_BUTTON = <<-HTML
<a class="btn railsstrap-aside-cancel-button" href="#aside" data-dismiss="aside">Cancel</a>
HTML

ASIDE_CLOSE_BUTTON = <<-HTML
<button class="close" data-dismiss="aside" aria-hidden="true">&times;</button>
HTML

