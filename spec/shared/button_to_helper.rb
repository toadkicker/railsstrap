shared_examples_for 'the button_to helper' do
  all_tests_pass_with 'the :variant button_to option'
  all_tests_pass_with 'the :size button_to option'
  all_tests_pass_with 'the :layout button_to option'
  all_tests_pass_with 'the button wrapped in navbar'
  all_tests_pass_with 'the button wrapped in nav'
end

#--

shared_examples_for 'the :variant button_to option' do
  Railsstrap::Button.variants.each do |variant, variant_class|
    specify %Q{set to :#{variant}, adds the class "#{variant_class}"} do
      html = %r{<(input|button).+class="btn #{variant_class}"}
      expect(button_to: {variant: variant.to_sym}).to generate html
    end
  end
end

shared_examples_for 'the :size button_to option' do
  Railsstrap::Button.sizes.each do |size, size_class|
    specify %Q{set to :#{size}, adds the class "#{size_class}"} do
      html = %r{<(input|button).+class="btn btn-primary #{size_class}"}
      expect(button_to: {size: size}).to generate html
    end
  end
end

shared_examples_for 'the :layout button_to option' do
  Railsstrap::Button.layouts.each do |layout, layout_class|
    specify %Q{set to :#{layout}, adds the class "#{layout_class}"} do
      html = %r{<(input|button).+class="btn btn-primary #{layout_class}"}
      expect(button_to: {layout: layout}).to generate html
    end
  end
end

shared_examples_for 'the button wrapped in navbar' do
  specify 'adds the "navbar-form" class to the form' do
    html = %r{^<form.+class="navbar-form"}
    railsstrap.navbar { expect(button_to: {variant: :primary}).to generate html }
  end
end


shared_examples_for 'the button wrapped in nav' do
  specify 'surrounds the form in a <li> item' do
    html = %r{^<li><form.+?</form></li>}
    railsstrap.nav { expect(:button_to).to generate html }
  end
end
