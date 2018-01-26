shared_examples_for 'the icon helper' do
  all_tests_pass_with 'no icon options'
  all_tests_pass_with 'extra icon options'
  all_tests_pass_with 'the :library icon option'
end

#--

shared_examples_for 'no icon options' do
  specify 'creates a <i> with an icon' do
    html = '<i class="far far-zoom-in"></i>'
    expect(:icon).to generate html
  end
end

shared_examples_for 'extra icon options' do
  specify 'passes the options to the <i>' do
    options = {name: :zoom_in, class: 'important', data: {value: 1}, id: 'my-icon'}
    html = '<i class="important far far-zoom-in" data-value="1" id="my-icon"></i>'
    expect(icon: options).to generate html
  end
end

shared_examples_for 'the :library icon option' do
  Railsstrap::Icon.libraries.each do |library, library_class|
    specify %Q{set to :#{library}, adds the class "#{library_class}"} do
      html = %Q{<i class="#{library_class} #{library_class}-zoom-in"></i>}
      expect(icon: {library: library}).to generate html
    end
  end
end