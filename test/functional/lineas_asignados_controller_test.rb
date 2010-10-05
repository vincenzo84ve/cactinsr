require 'test_helper'

class LineasAsignadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lineas_asignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lineas_asignado" do
    assert_difference('LineasAsignado.count') do
      post :create, :lineas_asignado => { }
    end

    assert_redirected_to lineas_asignado_path(assigns(:lineas_asignado))
  end

  test "should show lineas_asignado" do
    get :show, :id => lineas_asignados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lineas_asignados(:one).to_param
    assert_response :success
  end

  test "should update lineas_asignado" do
    put :update, :id => lineas_asignados(:one).to_param, :lineas_asignado => { }
    assert_redirected_to lineas_asignado_path(assigns(:lineas_asignado))
  end

  test "should destroy lineas_asignado" do
    assert_difference('LineasAsignado.count', -1) do
      delete :destroy, :id => lineas_asignados(:one).to_param
    end

    assert_redirected_to lineas_asignados_path
  end
end
