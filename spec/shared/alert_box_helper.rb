shared_examples_for 'the alert_box helper' do
  all_tests_pass_with 'no alert options'
  all_tests_pass_with 'extra alert options'
  all_tests_pass_with 'the :variant alert option'
  all_tests_pass_with 'the :dismissible alert option'
  all_tests_pass_with 'the :variant alert option'
end

#--

shared_examples_for 'no alert options' do
  specify 'sets the role and the class to "alert"' do
    html = '<div class="alert alert-info" role="alert">content</div>'
    expect(:alert_box).to generate html
  end
end

shared_examples_for 'extra alert options' do
  specify 'passes the options to the wrapping <div>' do
    options = {class: 'important', data: {value: 1}, id: 'my-alert'}
    html = '<div class="important alert alert-info" data-value="1" id="my-alert" role="alert">content</div>'
    expect(alert_box: options).to generate html
  end
end

shared_examples_for 'the :dismissible alert option' do
  specify 'set to false, does not display a button to dismiss the alert' do
    html = '<div class="alert alert-info" role="alert">content</div>'
    expect(alert_box: {dismissible: false}).to generate html
  end

  specify 'set to true, displays a button to dismiss the alert' do
    html = %r{<span aria-hidden="true">&times;</span>}
    expect(alert_box: {dismissible: true}).to generate html
  end
end

shared_examples_for 'the :variant alert option' do
  specify 'set, displays a button to dismiss the alert' do
    html = %r{<span aria-hidden="true">&times;</span>}
    expect(alert_box: {variant: :anything}).to generate html
  end

  specify 'when overriding Railsstrap::Base::ALERT_TYPES, sets to :notice, adds the class "alert-notice"' do
    Railsstrap::Base::VARIANT_TYPES = %i(notice)
    html = %r{<div class="alert alert-notice" role="alert">}
    expect(alert_box: {variant: :notice}).to generate html
  end

  specify 'set to :alert, adds the class "alert-info"' do
    html = %r{<div class="alert alert-info" role="alert">}
    expect(alert_box: {variant: :alert}).to generate html
  end
end