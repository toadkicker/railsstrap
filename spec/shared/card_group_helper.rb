shared_examples_for 'the card_group helper' do
  all_tests_pass_with 'no card_group options'
  all_tests_pass_with 'extra card_group options'
end

#--

shared_examples_for 'no card_group options' do
  specify 'displays an <div> with class="card-group"' do
    html = '<div class="card-group">content</div>'
    expect(:card_group).to generate html
  end
end

shared_examples_for 'extra card_group options' do
  specify 'passes the options to the <div>' do
    options = { class: 'important', data: {value: 1}, id: 'my-card-group' }
    html = '<div class="important card-group" data-value="1" id="my-card-group">content</div>'
    expect(card_group: options).to generate html  end
end