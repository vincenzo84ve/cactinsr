require 'test_helper'

class CgeneralsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cgenerals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cgeneral" do
    assert_difference('Cgeneral.count') do
      post :create, :cgeneral => { }
    end

    assert_redirected_to cgeneral_path(assigns(:cgeneral))
  end

  test "should show cgeneral" do
    get :show, :id => cgenerals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cgenerals(:one).to_param
    assert_response :success
  end

  test "should update cgeneral" do
    put :update, :id => cgenerals(:one).to_param, :cgeneral => { }
    assert_redirected_to cgeneral_path(assigns(:cgeneral))
  end

  test "should destroy cgeneral" do
    assert_difference('Cgeneral.count', -1) do
      delete :destroy, :id => cgenerals(:one).to_param
    end

    assert_redirected_to cgenerals_path
  end
end
