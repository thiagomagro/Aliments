require 'test_helper'

class AlimentosControllerTest < ActionController::TestCase
  setup do
    @alimento = alimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alimento" do
    assert_difference('Alimento.count') do
      post :create, :alimento => @alimento.attributes
    end

    assert_redirected_to alimento_path(assigns(:alimento))
  end

  test "should show alimento" do
    get :show, :id => @alimento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alimento.to_param
    assert_response :success
  end

  test "should update alimento" do
    put :update, :id => @alimento.to_param, :alimento => @alimento.attributes
    assert_redirected_to alimento_path(assigns(:alimento))
  end

  test "should destroy alimento" do
    assert_difference('Alimento.count', -1) do
      delete :destroy, :id => @alimento.to_param
    end

    assert_redirected_to alimentos_path
  end
end
