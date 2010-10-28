require 'test_helper'

class DesasignadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desasignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desasignado" do
    assert_difference('Desasignado.count') do
      post :create, :desasignado => { }
    end

    assert_redirected_to desasignado_path(assigns(:desasignado))
  end

  test "should show desasignado" do
    get :show, :id => desasignados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => desasignados(:one).to_param
    assert_response :success
  end

  test "should update desasignado" do
    put :update, :id => desasignados(:one).to_param, :desasignado => { }
    assert_redirected_to desasignado_path(assigns(:desasignado))
  end

  test "should destroy desasignado" do
    assert_difference('Desasignado.count', -1) do
      delete :destroy, :id => desasignados(:one).to_param
    end

    assert_redirected_to desasignados_path
  end
end
