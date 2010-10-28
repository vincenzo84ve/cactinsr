require 'test_helper'

class LineasDesasignadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lineas_desasignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lineas_desasignado" do
    assert_difference('LineasDesasignado.count') do
      post :create, :lineas_desasignado => { }
    end

    assert_redirected_to lineas_desasignado_path(assigns(:lineas_desasignado))
  end

  test "should show lineas_desasignado" do
    get :show, :id => lineas_desasignados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lineas_desasignados(:one).to_param
    assert_response :success
  end

  test "should update lineas_desasignado" do
    put :update, :id => lineas_desasignados(:one).to_param, :lineas_desasignado => { }
    assert_redirected_to lineas_desasignado_path(assigns(:lineas_desasignado))
  end

  test "should destroy lineas_desasignado" do
    assert_difference('LineasDesasignado.count', -1) do
      delete :destroy, :id => lineas_desasignados(:one).to_param
    end

    assert_redirected_to lineas_desasignados_path
  end
end
