require 'test_helper'

class CareasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:careas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carea" do
    assert_difference('Carea.count') do
      post :create, :carea => { }
    end

    assert_redirected_to carea_path(assigns(:carea))
  end

  test "should show carea" do
    get :show, :id => careas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => careas(:one).to_param
    assert_response :success
  end

  test "should update carea" do
    put :update, :id => careas(:one).to_param, :carea => { }
    assert_redirected_to carea_path(assigns(:carea))
  end

  test "should destroy carea" do
    assert_difference('Carea.count', -1) do
      delete :destroy, :id => careas(:one).to_param
    end

    assert_redirected_to careas_path
  end
end
