require 'spec_helper'
Dir['./spec/padrino/*_helper.rb'].each {|f| require f}

describe 'When used in Padrino or Middleman' do
  let(:railsstrap) { PadrinoView.new }
  before { Railsstrap.framework = :padrino }

  all_tests_pass_for 'the alert_box helper'
  all_tests_pass_for 'the bootstrap_css helper'
  all_tests_pass_for 'the bootstrap_js helper'
  all_tests_pass_for 'the bootstrap_theme_css helper'
  all_tests_pass_for 'the button helper'
  all_tests_pass_for 'the dropdown helper'
  all_tests_pass_for 'the font_awesome_css helper'
  all_tests_pass_for 'the glyphicon helper'
  all_tests_pass_for 'the horizontal helper'
  all_tests_pass_for 'the icon helper'
  all_tests_pass_for 'the modal helper'
  all_tests_pass_for 'the nav helper'
  all_tests_pass_for 'the navbar helper'
  all_tests_pass_for 'the card helper'
  all_tests_pass_for 'the card_group helper'
  all_tests_pass_for 'the progress_bar helper'
  all_tests_pass_for 'the vertical helper'

  all_tests_pass_for 'the button_to helper (Padrino)'
  all_tests_pass_for 'the link_to helper (Padrino)'
  all_tests_pass_for 'the link_to helper'
end unless ENV['ONLY_RAILS']
