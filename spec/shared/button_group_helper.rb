shared_examples_for 'the button group helper' do
  all_tests_pass_with 'no button group options'
  all_tests_pass_with 'html attributes'
  all_tests_pass_with 'with buttons included'
end

#--

shared_examples_for 'no button group options' do
  specify 'sets the class to "btn-group"' do
    html = %r{class="btn-group"}
    expect(:button_group).to generate html
  end
end

shared_examples_for 'html attributes' do
  specify 'accepts html attributes' do
    html = '<div data-foo="1" class="btn-group" role="group">content</div>'
    options = { role: 'group', data: { foo: 1 } }
    expect(button_group: options).to generate html
  end
end

shared_examples_for 'with buttons included' do
  specify 'accepts a block of buttons' do
    html = %r{button}
    railsstrap.button_group { expect(:button).to generate html }
  end
end
