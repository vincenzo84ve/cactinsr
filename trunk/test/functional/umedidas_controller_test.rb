require 'test_helper'

class UmedidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:umedidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create umedida" do
    assert_difference('Umedida.count') do
      post :create, :umedida => { }
    end

    assert_redirected_to umedida_path(assigns(:umedida))
  end

  test "should show umedida" do
    get :show, :id => umedidas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => umedidas(:one).to_param
    assert_response :success
  end

  test "should update umedida" do
    put :update, :id => umedidas(:one).to_param, :umedida => { }
    assert_redirected_to umedida_path(assigns(:umedida))
  end

  test "should destroy umedida" do
    assert_difference('Umedida.count', -1) do
      delete :destroy, :id => umedidas(:one).to_param
    end

    assert_redirected_to umedidas_path
  end
end
