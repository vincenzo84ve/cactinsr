require 'test_helper'

class LineasDespachosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lineas_despachos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lineas_despacho" do
    assert_difference('LineasDespacho.count') do
      post :create, :lineas_despacho => { }
    end

    assert_redirected_to lineas_despacho_path(assigns(:lineas_despacho))
  end

  test "should show lineas_despacho" do
    get :show, :id => lineas_despachos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lineas_despachos(:one).to_param
    assert_response :success
  end

  test "should update lineas_despacho" do
    put :update, :id => lineas_despachos(:one).to_param, :lineas_despacho => { }
    assert_redirected_to lineas_despacho_path(assigns(:lineas_despacho))
  end

  test "should destroy lineas_despacho" do
    assert_difference('LineasDespacho.count', -1) do
      delete :destroy, :id => lineas_despachos(:one).to_param
    end

    assert_redirected_to lineas_despachos_path
  end
end
