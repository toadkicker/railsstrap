shared_examples_for 'the badge helper' do
  all_tests_pass_with 'no badge options'
  all_tests_pass_with 'extra badge options'
  all_tests_pass_with 'the :variant badge option'
  all_tests_pass_with 'the :dismissible badge option'
  all_tests_pass_with 'the :priority badge option'
end

#--

shared_examples_for 'no badge options' do
  specify 'sets the role and the class to "badge"' do
    html = '<span class="badge badge-info" role="badge">content</span>'
    expect(:badge).to generate html
  end
end

shared_examples_for 'extra badge options' do
  specify 'passes the options to the wrapping <span>' do
    options = {class: 'important', data: {value: 1}, id: 'my-badge'}
    html = '<span class="important badge badge-info" data-value="1" id="my-badge" role="badge">content</span>'
    expect(badge: options).to generate html
  end
end

shared_examples_for 'the :variant badge option' do
  Railsstrap::Badge.variants.each do |variant, variant_class|
    specify %Q{set to :#{variant}, adds the class "#{variant_class}"} do
      html = %Q{<span class="badge #{variant_class}" role="badge">content</span>}
      expect(badge: {variant: variant.to_s}).to generate html
    end
  end
end

shared_examples_for 'the :dismissible badge option' do
  specify 'set to false, does not display a button to dismiss the badge' do
    html = '<span class="badge badge-info" role="badge">content</span>'
    expect(badge: {dismissible: false}).to generate html
  end

  specify 'set to true, displays a button to dismiss the badge' do
    html = %r{<span aria-hidden="true">&times;</span>}
    expect(badge: {dismissible: true}).to generate html
  end
end

shared_examples_for 'the :priority badge option' do
  specify 'set, displays a button to dismiss the badge' do
    html = %r{<span aria-hidden="true">&times;</span>}
    expect(badge: {priority: :anything}).to generate html
  end

  specify 'set to :notice, adds the class "badge-success"' do
    html = %r{<span class="badge badge-success" role="badge">}
    expect(badge: {priority: :notice}).to generate html
  end

  specify 'set to :badge, adds the class "badge-danger"' do
    html = %r{<span class="badge badge-danger" role="badge">}
    expect(badge: {priority: :badge}).to generate html
  end
end