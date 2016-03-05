require 'test_helper'

class AltsControllerTest < ActionController::TestCase
  setup do
    @alt = alts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alt" do
    assert_difference('Alt.count') do
      post :create, alt: {  }
    end

    assert_redirected_to alt_path(assigns(:alt))
  end

  test "should show alt" do
    get :show, id: @alt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alt
    assert_response :success
  end

  test "should update alt" do
    patch :update, id: @alt, alt: {  }
    assert_redirected_to alt_path(assigns(:alt))
  end

  test "should destroy alt" do
    assert_difference('Alt.count', -1) do
      delete :destroy, id: @alt
    end

    assert_redirected_to alts_path
  end
end
