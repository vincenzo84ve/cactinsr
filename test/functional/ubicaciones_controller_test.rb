require 'test_helper'

class UbicacionesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ubicaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ubicacione" do
    assert_difference('Ubicacione.count') do
      post :create, :ubicacione => { }
    end

    assert_redirected_to ubicacione_path(assigns(:ubicacione))
  end

  test "should show ubicacione" do
    get :show, :id => ubicaciones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ubicaciones(:one).to_param
    assert_response :success
  end

  test "should update ubicacione" do
    put :update, :id => ubicaciones(:one).to_param, :ubicacione => { }
    assert_redirected_to ubicacione_path(assigns(:ubicacione))
  end

  test "should destroy ubicacione" do
    assert_difference('Ubicacione.count', -1) do
      delete :destroy, :id => ubicaciones(:one).to_param
    end

    assert_redirected_to ubicaciones_path
  end
end
