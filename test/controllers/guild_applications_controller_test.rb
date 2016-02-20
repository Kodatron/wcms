require 'test_helper'

class GuildApplicationsControllerTest < ActionController::TestCase
  setup do
    @guild_application = guild_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guild_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guild_application" do
    assert_difference('GuildApplication.count') do
      post :create, guild_application: {  }
    end

    assert_redirected_to guild_application_path(assigns(:guild_application))
  end

  test "should show guild_application" do
    get :show, id: @guild_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guild_application
    assert_response :success
  end

  test "should update guild_application" do
    patch :update, id: @guild_application, guild_application: {  }
    assert_redirected_to guild_application_path(assigns(:guild_application))
  end

  test "should destroy guild_application" do
    assert_difference('GuildApplication.count', -1) do
      delete :destroy, id: @guild_application
    end

    assert_redirected_to guild_applications_path
  end
end
