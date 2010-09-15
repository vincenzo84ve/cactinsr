require 'test_helper'

class AsignadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignado" do
    assert_difference('Asignado.count') do
      post :create, :asignado => { }
    end

    assert_redirected_to asignado_path(assigns(:asignado))
  end

  test "should show asignado" do
    get :show, :id => asignados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asignados(:one).to_param
    assert_response :success
  end

  test "should update asignado" do
    put :update, :id => asignados(:one).to_param, :asignado => { }
    assert_redirected_to asignado_path(assigns(:asignado))
  end

  test "should destroy asignado" do
    assert_difference('Asignado.count', -1) do
      delete :destroy, :id => asignados(:one).to_param
    end

    assert_redirected_to asignados_path
  end
end
