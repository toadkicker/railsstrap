# encoding: utf-8
require 'spec_helper'
require_relative '../../../app/helpers/railsstrap/bootstrap_flash_helper'

include ActionView::Helpers
include Railsstrap::BootstrapFlashHelper

describe Railsstrap::BootstrapFlashHelper, :type => :helper do
  describe 'bootstrap_flash' do
    let(:flash) { ActionDispatch::Flash::FlashHash.new }
    before { allow(self).to receive(:flash).and_return flash }

    context 'when type is :notice' do
      before { flash[:notice] = 'success flash' }

      it 'should return a success flash message' do
        expect(bootstrap_flash.gsub(/\s/, '').downcase)
        .to eql(BASIC_SUCCESS_FLASH.gsub(/\s/, '').downcase)
      end
    end

    context 'when type is :alert' do
      before { flash[:alert] = 'danger flash' }

      it 'should return a danger flash message' do
        expect(bootstrap_flash.gsub(/\s/, '').downcase)
        .to eql(BASIC_DANGER_FLASH.gsub(/\s/, '').downcase)
      end
    end

    context 'when type is :error' do
      before { flash[:error] = 'danger flash' }

      it 'should return a danger flash message' do
        expect(bootstrap_flash.gsub(/\s/, '').downcase)
        .to eql(BASIC_DANGER_FLASH.gsub(/\s/, '').downcase)
      end
    end

    context 'when class is set' do
      before { flash[:notice] = 'success flash' }

      it 'should display the class' do
        expect(bootstrap_flash({class: 'success-class'}).gsub(/\s/, '').downcase)
        .to eql(BASIC_SUCCESS_FLASH_WITH_CLASS.gsub(/\s/, '').downcase)
      end
    end

    context 'when animation is set' do
      before { flash[:notice] = 'success flash' }

      it 'should display the animation class' do
        expect(bootstrap_flash({animation: 'flip-x'}).gsub(/\s/, '').downcase)
        .to eql(BASIC_SUCCESS_FLASH_WITH_ANIMATION.gsub(/\s/, '').downcase)
      end
    end

    context 'when container_tag is set' do
      before { flash[:notice] = 'success flash' }
      it 'should use a span for the container' do
        expect(bootstrap_flash({container_tag: :span}).gsub(/\s/, '').downcase)
        .to eql(BASIC_SUCCESS_FLASH_WITH_SPAN.gsub(/\s/, '').downcase)
      end
    end

    context 'when show_button is set to false' do
      before { flash[:notice] = 'success flash' }
      it 'should not output a close button' do
        expect(bootstrap_flash({show_close: false}).gsub(/\s/, '').downcase)
        .to eql(BASIC_SUCCESS_WITHOUT_BUTTON.gsub(/\s/, '').downcase)
      end
    end

  end
end

BASIC_DANGER_FLASH = <<-HTML
<div class="alert fade in alert-danger">
  <button class="close" data-dismiss="alert" type="button">&times;</button>danger flash
</div>
HTML

BASIC_SUCCESS_FLASH = <<-HTML
<div class="alert fade in alert-success">
  <button class="close" data-dismiss="alert" type="button">&times;</button>success flash
</div>
HTML

BASIC_SUCCESS_WITHOUT_BUTTON = <<-HTML
<div class="alert fade in alert-success">
  success flash
</div>
HTML

BASIC_SUCCESS_FLASH_WITH_CLASS = <<-HTML
<div class="alert fade in alert-success success-class">
  <button class="close" data-dismiss="alert" type="button">&times;</button>success flash
</div>
HTML

BASIC_SUCCESS_FLASH_WITH_ANIMATION = <<-HTML
<div class="alert flip-x alert-success">
  <button class="close" data-dismiss="alert" type="button">&times;</button>success flash
</div>
HTML

BASIC_SUCCESS_FLASH_WITH_SPAN = <<-HTML
<span class="alert fade in alert-success">
  <button class="close" data-dismiss="alert" type="button">&times;</button>success flash
</span>
HTML

BLOCK_FLASH = <<-HTML
<span>wat</span>
HTML