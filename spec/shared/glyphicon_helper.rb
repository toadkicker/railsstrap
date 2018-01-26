shared_examples_for 'the glyphicon helper' do
  all_tests_pass_with 'no glyphicon options'
  all_tests_pass_with 'extra glyphicon options'
end

#--

shared_examples_for 'no glyphicon options' do
  specify 'creates a <i> with an icon' do
    html = '<i class="glyphicon glyphicon-zoom-in"></i>'
    expect(glyphicon: :zoom_in).to generate html
  end
end

shared_examples_for 'extra glyphicon options' do
  specify 'passes the options to the <span>' do
    options = {name: :zoom_in, tag: :span, class: 'important', data: {value: 1}, id: 'my-glyphicon'}
    html = '<span class="important glyphicon glyphicon-zoom-in" data-value="1" id="my-glyphicon"></span>'
    expect(glyphicon: options).to generate html
  end
end