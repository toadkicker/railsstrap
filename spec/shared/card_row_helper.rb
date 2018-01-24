shared_examples_for 'the card_row helper' do
  all_tests_pass_with 'no card_row options'
  all_tests_pass_with 'extra card_row options'
end

#--

shared_examples_for 'no card_row options' do
  specify 'displays an <div> with class="row"' do
    html = '<div class="row">content</div>'
    expect(:card_row).to generate html
  end
end

shared_examples_for 'extra card_row options' do
  specify 'passes the options to the <div>' do
    options = {class: 'important', data: {value: 1}, id: 'my-card-row'}
    html = '<div class="important row" data-value="1" id="my-card-row">content</div>'
    expect(card_row: options).to generate html
  end
end