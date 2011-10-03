require 'test_helper'

class ExpenseForRoundsControllerTest < ActionController::TestCase
  setup do
    @expense_for_round = expense_for_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_for_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_for_round" do
    assert_difference('ExpenseForRound.count') do
      post :create, :expense_for_round => @expense_for_round.attributes
    end

    assert_redirected_to expense_for_round_path(assigns(:expense_for_round))
  end

  test "should show expense_for_round" do
    get :show, :id => @expense_for_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @expense_for_round.to_param
    assert_response :success
  end

  test "should update expense_for_round" do
    put :update, :id => @expense_for_round.to_param, :expense_for_round => @expense_for_round.attributes
    assert_redirected_to expense_for_round_path(assigns(:expense_for_round))
  end

  test "should destroy expense_for_round" do
    assert_difference('ExpenseForRound.count', -1) do
      delete :destroy, :id => @expense_for_round.to_param
    end

    assert_redirected_to expense_for_rounds_path
  end
end
