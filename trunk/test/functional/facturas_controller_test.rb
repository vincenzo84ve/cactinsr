require 'test_helper'

class FacturasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facturas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factura" do
    assert_difference('Factura.count') do
      post :create, :factura => { }
    end

    assert_redirected_to factura_path(assigns(:factura))
  end

  test "should show factura" do
    get :show, :id => facturas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => facturas(:one).to_param
    assert_response :success
  end

  test "should update factura" do
    put :update, :id => facturas(:one).to_param, :factura => { }
    assert_redirected_to factura_path(assigns(:factura))
  end

  test "should destroy factura" do
    assert_difference('Factura.count', -1) do
      delete :destroy, :id => facturas(:one).to_param
    end

    assert_redirected_to facturas_path
  end
end
