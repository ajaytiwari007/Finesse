require 'test_helper'

class MacroIndicatorForRoundsControllerTest < ActionController::TestCase
  setup do
    @macro_indicator_for_round = macro_indicator_for_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:macro_indicator_for_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create macro_indicator_for_round" do
    assert_difference('MacroIndicatorForRound.count') do
      post :create, :macro_indicator_for_round => @macro_indicator_for_round.attributes
    end

    assert_redirected_to macro_indicator_for_round_path(assigns(:macro_indicator_for_round))
  end

  test "should show macro_indicator_for_round" do
    get :show, :id => @macro_indicator_for_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @macro_indicator_for_round.to_param
    assert_response :success
  end

  test "should update macro_indicator_for_round" do
    put :update, :id => @macro_indicator_for_round.to_param, :macro_indicator_for_round => @macro_indicator_for_round.attributes
    assert_redirected_to macro_indicator_for_round_path(assigns(:macro_indicator_for_round))
  end

  test "should destroy macro_indicator_for_round" do
    assert_difference('MacroIndicatorForRound.count', -1) do
      delete :destroy, :id => @macro_indicator_for_round.to_param
    end

    assert_redirected_to macro_indicator_for_rounds_path
  end
end
