require 'test_helper'

class FoosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foo = foos(:one)
  end

  test "should get index" do
    get foos_url
    assert_response :success
  end

  test "should get new" do
    get new_foo_url
    assert_response :success
  end

  test "should create foo" do
    assert_difference('Foo.count') do
      post foos_url, params: { foo: { crank: @foo.crank, sprocket: @foo.sprocket, widget: @foo.widget } }
    end

    assert_redirected_to foo_url(Foo.last)
  end

  test "should show foo" do
    get foo_url(@foo)
    assert_response :success
  end

  test "should get edit" do
    get edit_foo_url(@foo)
    assert_response :success
  end

  test "should update foo" do
    patch foo_url(@foo), params: { foo: { crank: @foo.crank, sprocket: @foo.sprocket, widget: @foo.widget } }
    assert_redirected_to foo_url(@foo)
  end

  test "should destroy foo" do
    assert_difference('Foo.count', -1) do
      delete foo_url(@foo)
    end

    assert_redirected_to foos_url
  end
end
