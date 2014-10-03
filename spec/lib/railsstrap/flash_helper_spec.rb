require 'spec_helper'
require_relative '../../../app/helpers/railsstrap/bootstrap_flash_helper'

describe 'flash helper' do

  class BaseTestController < AbstractController::Base
    include Railsstrap::BootstrapFlashHelper
    include ActionDispatch
  end

  class TestController < BaseTestController
    def index
      flash.now[:info] = 'This is an info message'
    end
  end

  before do
    @controller = TestController.new
    @controller.process(:index)
  end

  describe TestController do
    it 'shows an info flash message' do
      expect(false).to eql FLASH_BLOCK_HTML
    end
  end

end

FLASH_BLOCK_HTML = <<-HTML
<div class="alert alert-info" role="alert">This is an info message</div>
HTML