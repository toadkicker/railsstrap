shared_examples_for 'the nav helper' do
  all_tests_pass_with 'no nav options'
  all_tests_pass_with 'extra nav options'
  all_tests_pass_with 'the :as nav option'
  all_tests_pass_with 'the :layout nav option'
  all_tests_pass_with 'the nav wrapped in navbar'
end

#--

shared_examples_for 'no nav options' do
  specify 'creates a <nav> element with the "navigation" role' do
    html = %r{<nav.+role="navigation"(.*)<\/nav>}
    expect(:nav).to generate html
  end
end

shared_examples_for 'extra nav options' do
  specify 'passes the options to the <ul> element' do
    options = {class: 'important', data: {value: 1}, id: 'my-alert'}
    html = %r{(important).*(data-value="1").*(id="my-alert")}
    expect(nav: options).to generate html
  end
end

shared_examples_for 'the :as nav option' do
  Railsstrap::Nav.styles.each do |style, style_class|
    specify %Q{set to :#{context}, sets the class "#{style_class}"} do
      html = %r{<nav class="nav #{style_class}"}
      expect(nav: {as: style}).to generate html
    end
  end
end

shared_examples_for 'the :layout nav option' do
  Railsstrap::Nav.layouts.each do |layout, layout_class|
    specify %Q{set to :#{layout}, adds the class "#{layout_class}"} do
      html = %r{<nav class="nav #{layout_class}"}
      expect(nav: {layout: layout}).to generate html
    end
  end
end

shared_examples_for 'the nav wrapped in navbar' do
  specify 'creates a <nav> element with the "navbar-nav" class' do
    html = %r{<nav.*(role="navigation")*(class="nav navbar-nav").+<\/nav>}
    railsstrap.navbar { expect(:nav).to generate html }
  end
end