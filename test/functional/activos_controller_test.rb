require 'test_helper'

class ActivosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo" do
    assert_difference('Activo.count') do
      post :create, :activo => { }
    end

    assert_redirected_to activo_path(assigns(:activo))
  end

  test "should show activo" do
    get :show, :id => activos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => activos(:one).to_param
    assert_response :success
  end

  test "should update activo" do
    put :update, :id => activos(:one).to_param, :activo => { }
    assert_redirected_to activo_path(assigns(:activo))
  end

  test "should destroy activo" do
    assert_difference('Activo.count', -1) do
      delete :destroy, :id => activos(:one).to_param
    end

    assert_redirected_to activos_path
  end
end
