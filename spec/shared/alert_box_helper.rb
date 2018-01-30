shared_examples_for 'the alert_box helper' do
  all_tests_pass_with 'no alert options'
  all_tests_pass_with 'extra alert options'
  all_tests_pass_with 'the :variant alert option'
  all_tests_pass_with 'the :dismissible alert option'
  all_tests_pass_with 'the :priority alert option'
  all_tests_pass_with 'the :size alert option'
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

shared_examples_for 'the :variant alert option' do
  Railsstrap::AlertBox.variants.each do |variant, variant_class|
    specify %Q{set to :#{variant}, adds the class "#{variant_class}"} do
      html = %Q{<div class="alert #{variant_class}" role="alert">content</div>}
      expect(alert_box: {variant: variant.to_s}).to generate html
    end
  end
end

shared_examples_for 'the :dismissible alert option' do
  specify 'set to false, does not display a button to dismiss the alert' do
    html = '<div class="alert alert-info" role="alert">content</div>'
    expect(alert_box: {dismissible: false}).to generate html
  end

  specify 'set to true, displays a button to dismiss the alert' do
    html = %r{.*(class="close").*(dismiss="alert")}
    expect(alert_box: {dismissible: true}).to generate html
  end
end

shared_examples_for 'the :priority alert option' do
  specify 'set, displays a button to dismiss the alert' do
    html = %r{.*(class="close").*(dismiss="alert")}
    expect(alert_box: {priority: :anything}).to generate html
  end

  specify 'set to :notice, adds the class "alert-success"' do
    html = %r{<div class="alert alert-success" role="alert">}
    expect(alert_box: {priority: :notice}).to generate html
  end

  specify 'set to :alert, adds the class "alert-danger"' do
    html = %r{<div class="alert alert-danger" role="alert">}
    expect(alert_box: {priority: :alert}).to generate html
  end
end

shared_examples_for 'the :size alert option' do
  specify 'sets a :lg styled alert' do
    html = %r{.*class.*alert-lg.*}
    expect(alert_box: {size: :lg, variant: :success}).to generate html
    end
  specify 'sets a :sm styled alert' do
    html = %r{.*class.*alert-sm.*}
    expect(alert_box: {size: :sm, variant: :success}).to generate html
  end
end