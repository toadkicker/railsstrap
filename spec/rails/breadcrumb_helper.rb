shared_examples_for 'the breadcrumb helper' do
  all_tests_pass_with 'no breadcrumb options'
end

#--

shared_examples_for 'no breadcrumb options' do
  specify 'outputs the root breadcrumb' do
    html = %r{.*class='breadcrumb'.*}
    railsstrap.breadcrumbs { expect(:add_breadcrumb, {title: "Home", url: "/"}) }.to generate html
  end
end
