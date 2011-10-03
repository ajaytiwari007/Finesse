require 'test_helper'

class MacroIndicatorOptionsControllerTest < ActionController::TestCase
  setup do
    @macro_indicator_option = macro_indicator_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:macro_indicator_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create macro_indicator_option" do
    assert_difference('MacroIndicatorOption.count') do
      post :create, :macro_indicator_option => @macro_indicator_option.attributes
    end

    assert_redirected_to macro_indicator_option_path(assigns(:macro_indicator_option))
  end

  test "should show macro_indicator_option" do
    get :show, :id => @macro_indicator_option.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @macro_indicator_option.to_param
    assert_response :success
  end

  test "should update macro_indicator_option" do
    put :update, :id => @macro_indicator_option.to_param, :macro_indicator_option => @macro_indicator_option.attributes
    assert_redirected_to macro_indicator_option_path(assigns(:macro_indicator_option))
  end

  test "should destroy macro_indicator_option" do
    assert_difference('MacroIndicatorOption.count', -1) do
      delete :destroy, :id => @macro_indicator_option.to_param
    end

    assert_redirected_to macro_indicator_options_path
  end
end
