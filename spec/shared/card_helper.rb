shared_examples_for 'the card helper' do
  all_tests_pass_with 'no card options'
  all_tests_pass_with 'extra card options (except :id)'
  all_tests_pass_with 'the :header card option'
  all_tests_pass_with 'the :title card option'
  all_tests_pass_with 'the :body card option'
  all_tests_pass_with 'the :variant card option'
  all_tests_pass_with 'the :tag card option'
  all_tests_pass_with 'the :img card option'
  all_tests_pass_with 'the card wrapped in card_row'
end

#--

shared_examples_for 'no card options' do
  specify 'displays a <div> with class="card bg-default"' do
    html = %r{^<div class="card bg-default">(?:|<div class="card-body">)content(?:|</div>)</div>$}
    expect(:card).to generate html
  end
end

shared_examples_for 'extra card options (except :id)' do
  specify 'passes the options to the <div> card' do
    options = {class: 'important', data: {value: 1}}
    html = %r{^<div class="important card bg-default" data-value="1">(?:|<div class="card-body">)content(?:|</div>)</div>$}
    expect(card: options).to generate html
  end
end

shared_examples_for 'the :header card option' do
  specify 'sets the header of the card to the specified value' do
    html = %r{^<div class="card bg-default"><div class="card-header">Heading</div>}
    expect(card: {header: 'Heading'}).to generate html
  end
end

shared_examples_for 'the :title card option' do
  specify 'sets the title of the card to the specified value' do
    html = %r{^<div class="card bg-default"><div class="card-header"><h3 class="card-title">Title</h3></div>}
    expect(card: {title: 'Title'}).to generate html
  end
end

shared_examples_for 'the :body card option' do
  let(:html) { %r{<div class="card-body">Body</div>} }

  specify 'given either a content or a block, is ignored' do
    expect(card: {body: 'Body'}).not_to generate html
  end

  specify 'given neither content nor a block, it is displayed as the content' do
    expect(railsstrap.card(body: 'Body')).to match html
  end
end

shared_examples_for 'the :tag card option' do
  specify 'uses the HTML tag instead of <div> to wrap the card' do
    html =  %r{^<aside class="card bg-default">.*</aside>$}m
    expect(card: {tag: :aside}).to generate html
  end
end

shared_examples_for 'the :variant card option' do
  Railsstrap::Card.variants.each do |variant, variant_class|
    specify %Q{set to :#{variant}, adds the class "#{variant_class}"} do
      html = %r{^<div class="card #{variant_class}">.*</div>$}m
      expect(card: {variant: variant}).to generate html
    end
  end
end

shared_examples_for 'the card wrapped in card_row' do
  specify 'wraps the card <div> in a grid <div> with the :layout class of the card row' do
    html = %r{^<div class="card-deck"><div class="card bg-default">(?:|<div class="card-body">)content(?:|</div>)</div></div>$}
    railsstrap.card_group(layout: :deck) { expect(:card).to generate html }
  end
end

shared_examples_for 'the :img card option' do
  specify 'adds an image tag with the "card-img-top" class' do
    html = %r{.*<img class="card-img-top".*}
    expect(card: {img: '/some.jpg'}).to generate html
  end
end