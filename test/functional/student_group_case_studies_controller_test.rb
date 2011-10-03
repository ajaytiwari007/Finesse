require 'test_helper'

class StudentGroupCaseStudiesControllerTest < ActionController::TestCase
  setup do
    @student_group_case_study = student_group_case_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_case_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_group_case_study" do
    assert_difference('StudentGroupCaseStudy.count') do
      post :create, :student_group_case_study => @student_group_case_study.attributes
    end

    assert_redirected_to student_group_case_study_path(assigns(:student_group_case_study))
  end

  test "should show student_group_case_study" do
    get :show, :id => @student_group_case_study.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_group_case_study.to_param
    assert_response :success
  end

  test "should update student_group_case_study" do
    put :update, :id => @student_group_case_study.to_param, :student_group_case_study => @student_group_case_study.attributes
    assert_redirected_to student_group_case_study_path(assigns(:student_group_case_study))
  end

  test "should destroy student_group_case_study" do
    assert_difference('StudentGroupCaseStudy.count', -1) do
      delete :destroy, :id => @student_group_case_study.to_param
    end

    assert_redirected_to student_group_case_studies_path
  end
end
