require 'test_helper'

class MacroIndicatorsControllerTest < ActionController::TestCase
  setup do
    @macro_indicator = macro_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:macro_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create macro_indicator" do
    assert_difference('MacroIndicator.count') do
      post :create, :macro_indicator => @macro_indicator.attributes
    end

    assert_redirected_to macro_indicator_path(assigns(:macro_indicator))
  end

  test "should show macro_indicator" do
    get :show, :id => @macro_indicator.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @macro_indicator.to_param
    assert_response :success
  end

  test "should update macro_indicator" do
    put :update, :id => @macro_indicator.to_param, :macro_indicator => @macro_indicator.attributes
    assert_redirected_to macro_indicator_path(assigns(:macro_indicator))
  end

  test "should destroy macro_indicator" do
    assert_difference('MacroIndicator.count', -1) do
      delete :destroy, :id => @macro_indicator.to_param
    end

    assert_redirected_to macro_indicators_path
  end
end
