require 'test_helper'

class RangeSpecificationsControllerTest < ActionController::TestCase
  setup do
    @range_specification = range_specifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:range_specifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create range_specification" do
    assert_difference('RangeSpecification.count') do
      post :create, :range_specification => @range_specification.attributes
    end

    assert_redirected_to range_specification_path(assigns(:range_specification))
  end

  test "should show range_specification" do
    get :show, :id => @range_specification.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @range_specification.to_param
    assert_response :success
  end

  test "should update range_specification" do
    put :update, :id => @range_specification.to_param, :range_specification => @range_specification.attributes
    assert_redirected_to range_specification_path(assigns(:range_specification))
  end

  test "should destroy range_specification" do
    assert_difference('RangeSpecification.count', -1) do
      delete :destroy, :id => @range_specification.to_param
    end

    assert_redirected_to range_specifications_path
  end
end
