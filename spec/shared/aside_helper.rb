shared_examples_for 'the aside helper' do
  all_tests_pass_with 'no aside options'
  all_tests_pass_with 'the :id aside option'
  all_tests_pass_with 'the :body aside option'
  all_tests_pass_with 'the :title aside option'
  all_tests_pass_with 'the :size aside option'
  all_tests_pass_with 'the button: :caption aside option'
  all_tests_pass_with 'the button: :variant aside option'
  all_tests_pass_with 'the button: :size aside option'
  all_tests_pass_with 'the button: :class aside option'
end

#--

shared_examples_for 'no aside options' do
  specify 'sets the role and the class to "aside", uses a generated ID and uses "Aside" as the title and caption' do
    html = %r{(button.*data-toggle="modal".*data-target)*(aside)}
    expect(:aside).to generate %r{#{html}}
  end
end

shared_examples_for 'the :id aside option' do
  specify 'uses the ID to connect button and aside' do
    id = 'my-aside'
    expect(aside: {id: id}).to generate %r{<button.+data-target="##{id}">Aside<\/button>}
    expect(aside: {id: id}).to generate %r{<aside.+id="#{id}".+aria-labelledby="label-#{id}".+>}
    expect(aside: {id: id}).to generate %r{<h4.+id="label-#{id}">Aside<\/h4>}
  end
end

shared_examples_for 'the :body aside option' do
  let(:html) { %r{<div class="aside-body">Body</div>} }

  specify 'given either a content or a block, is ignored' do
    expect(aside: {body: 'Body'}).not_to generate html
  end

  specify 'given neither content nor a block, it is displayed as the content' do
    expect(railsstrap.aside(body: 'Body')).to match html
  end
end

shared_examples_for 'the :title aside option' do
  specify 'sets the aside title to the given value' do
    html = %r{<h4 class="aside-title".+>Title</h4>}
    expect(aside: {title: 'Title'}).to generate html
  end
end

shared_examples_for 'the :size aside option'do
  Railsstrap::Aside.dialog_sizes.each do |size, size_class|
    specify %Q{set to :#{size}, adds the class "#{size_class}"}  do
      html = %r{<div class="aside-dialog #{size_class}">}
      expect(aside: {size: size}).to generate html
    end
  end
end

shared_examples_for 'the button: :caption aside option' do
  specify 'sets the button caption to the given value' do
    html = %r{<button.+>Click me</button>}
    expect(aside: {button: {caption: 'Click me'}}).to generate html
  end
end

shared_examples_for 'the button: :variant aside option' do
  Railsstrap::Button.variants.each do |variant, variant_class|
    specify %Q{set to :#{variant}, adds the class "#{variant_class}"} do
      html = %r{<button class="btn #{variant_class}"}
      expect(aside: {button: {variant: variant}}).to generate html
    end
  end
end

shared_examples_for 'the button: :size aside option' do
  Railsstrap::Button.sizes.each do |size, size_class|
    specify %Q{set to :#{size}, adds the class "#{size_class}"} do
      html = %r{<button class="btn btn-primary #{size_class}"}
      expect(aside: {button: {size: size}}).to generate html
    end
  end
end

shared_examples_for 'the button: :class aside option' do
  specify 'appends the class to the aside button' do
    html = %r{<button class="important btn btn-primary"}
    expect(aside: {button: {class: 'important'}}).to generate html
  end
end