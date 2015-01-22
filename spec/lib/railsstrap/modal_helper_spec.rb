# encoding: utf-8
require 'spec_helper'
require_relative '../../../app/helpers/railsstrap/modal_helper'

include ActionView::Helpers
include ActionView::Context
include Railsstrap::ModalHelper

describe Railsstrap::ModalHelper, :type => :helper do
  header_with_close = {:show_close => true, :dismiss => 'modal', :title => 'Modal header'}
  header_without_close = {:show_close => false, :title => 'Modal header'}
  options = {:id => "modal",
             :header => header_with_close,
             :body => {content: 'This is the body'},
             :footer => {content: content_tag(:button, 'Save', :class => 'btn')}
  }

  it 'returns a complete modal' do
    expect(modal_dialog(options).gsub(/\s/, '')).to eql BASIC_MODAL.gsub(/\s/, '')
  end

  it 'returns a centered modal' do
    options[:class] = 'center'
    expect(modal_dialog(options).gsub(/\s/, '')).to eql CENTERED_MODAL.gsub(/\s/, '')
  end

  it 'returns a modal header with a close button if show_close is true' do
    expect(modal_header(header_with_close).gsub(/\s/, '')).to eql MODAL_HEADER_WITH_CLOSE.gsub(/\s/, '')
  end

  it 'renders a modal header without a close button' do
    expect(modal_header(header_without_close).gsub(/\s/, '')).to eql MODAL_HEADER_WITHOUT_CLOSE.gsub(/\s/, '')
  end

  it 'renders a modal body' do
    expect(modal_body(options[:body]).gsub(/\s/, '')).to eql MODAL_BODY.gsub(/\s/, '')
  end

  it 'renders a modal footer' do
    expect(modal_footer(options[:footer]).gsub(/\s/, '')).to eql MODAL_FOOTER.gsub(/\s/, '')
  end

  it 'renders a close button' do
    expect(close_button('modal')).to eql CLOSE_BUTTON.gsub(/\n/, '')
  end

  it 'renders a modal toggle button' do
    expect(modal_toggle(:content => 'Save', :href => "#modal").gsub(/\s/, '')).to eql MODAL_TOGGLE.gsub(/\s/, '')
  end

  it 'renders a modal toggle button with options changed' do
    expect(modal_toggle(:content => 'Save', :href => "#modal", :data => {:foo => true, :toggle => 'modal'}).gsub(/\s/, '')).to eql MODAL_TOGGLE_OPTS.gsub(/\s/, '')
  end

  it 'renders a modal toggle button with a block given' do
    expect(modal_toggle(:href => "#modal", :data => {:foo => true, :toggle => 'modal'}){ content_tag(:span, 'Blocks Rock', class: "i-added-you") }.gsub(/\s/, '')).to eql MODAL_TOGGLE_BLOCK.gsub(/\s/, '')
  end

  it 'renders a cancel button' do
    expect(modal_cancel_button('Cancel', :href => "#modal", :data => {:dismiss => 'modal'}).gsub(/\s/, '')).to eql MODAL_CANCEL_BUTTON.gsub(/\s/, '')
  end
end

BASIC_MODAL = <<-HTML
<div id="modal" class="railsstrap-modal modal fade">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Modal header</h4>
      </div>
      <div class="modal-body">This is the body</div>
      <div class="modal-footer">
        <button class="btn">Save</button>
      </div>
    </div>
  </div>
</div>
HTML

CENTERED_MODAL = <<-HTML
<div id="modal" class="railsstrap-modal modal center fade">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Modal header</h4>
      </div>
      <div class="modal-body">This is the body</div>
      <div class="modal-footer">
        <button class="btn">Save</button>
      </div>
    </div>
  </div>
</div>
HTML

MODAL_BODY = <<-HTML
<div class="modal-body">This is the body</div>
HTML

MODAL_FOOTER = <<-HTML
<div class="modal-footer"><button class="btn">Save</button></div>
HTML

MODAL_HEADER_WITHOUT_CLOSE = <<-HTML
<div class="modal-header"><h4 class="modal-title">Modal header</h4></div>
HTML

MODAL_HEADER_WITH_CLOSE = <<-HTML
<div class="modal-header">
  <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4 class="modal-title">Modal header</h4>
</div>
HTML

MODAL_TOGGLE = <<-HTML
<a class="btn btn-default" data-toggle="modal" href="#modal">Save</a>
HTML

MODAL_TOGGLE_OPTS = <<-HTML
<a class="btn btn-default" data-foo="true" data-toggle="modal" href="#modal">Save</a>
HTML

MODAL_TOGGLE_BLOCK = <<-HTML
<a class="btn btn-default" data-foo="true" data-toggle="modal" href="#modal">
  <span class="i-added-you">
    Blocks Rock
  </span>
</a>
HTML

MODAL_CANCEL_BUTTON = <<-HTML
<a class="btn railsstrap-modal-cancel-button" href="#modal" data-dismiss="modal">Cancel</a>
HTML

CLOSE_BUTTON = <<-HTML
<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
HTML

