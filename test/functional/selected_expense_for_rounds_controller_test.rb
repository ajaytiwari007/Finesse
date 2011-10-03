require 'test_helper'

class SelectedExpenseForRoundsControllerTest < ActionController::TestCase
  setup do
    @selected_expense_for_round = selected_expense_for_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selected_expense_for_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selected_expense_for_round" do
    assert_difference('SelectedExpenseForRound.count') do
      post :create, :selected_expense_for_round => @selected_expense_for_round.attributes
    end

    assert_redirected_to selected_expense_for_round_path(assigns(:selected_expense_for_round))
  end

  test "should show selected_expense_for_round" do
    get :show, :id => @selected_expense_for_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @selected_expense_for_round.to_param
    assert_response :success
  end

  test "should update selected_expense_for_round" do
    put :update, :id => @selected_expense_for_round.to_param, :selected_expense_for_round => @selected_expense_for_round.attributes
    assert_redirected_to selected_expense_for_round_path(assigns(:selected_expense_for_round))
  end

  test "should destroy selected_expense_for_round" do
    assert_difference('SelectedExpenseForRound.count', -1) do
      delete :destroy, :id => @selected_expense_for_round.to_param
    end

    assert_redirected_to selected_expense_for_rounds_path
  end
end
