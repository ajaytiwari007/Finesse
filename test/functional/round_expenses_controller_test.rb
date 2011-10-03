require 'test_helper'

class RoundExpensesControllerTest < ActionController::TestCase
  setup do
    @round_expense = round_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:round_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round_expense" do
    assert_difference('RoundExpense.count') do
      post :create, :round_expense => @round_expense.attributes
    end

    assert_redirected_to round_expense_path(assigns(:round_expense))
  end

  test "should show round_expense" do
    get :show, :id => @round_expense.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @round_expense.to_param
    assert_response :success
  end

  test "should update round_expense" do
    put :update, :id => @round_expense.to_param, :round_expense => @round_expense.attributes
    assert_redirected_to round_expense_path(assigns(:round_expense))
  end

  test "should destroy round_expense" do
    assert_difference('RoundExpense.count', -1) do
      delete :destroy, :id => @round_expense.to_param
    end

    assert_redirected_to round_expenses_path
  end
end
