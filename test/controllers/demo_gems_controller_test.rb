require 'test_helper'

class DemoGemsControllerTest < ActionController::TestCase
  setup do
    @demo_gem = demo_gems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demo_gems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demo_gem" do
    assert_difference('DemoGem.count') do
      post :create, demo_gem: { code: @demo_gem.code, description: @demo_gem.description, github: @demo_gem.github, image: @demo_gem.image, name: @demo_gem.name, rubygems: @demo_gem.rubygems }
    end

    assert_redirected_to demo_gem_path(assigns(:demo_gem))
  end

  test "should show demo_gem" do
    get :show, id: @demo_gem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demo_gem
    assert_response :success
  end

  test "should update demo_gem" do
    patch :update, id: @demo_gem, demo_gem: { code: @demo_gem.code, description: @demo_gem.description, github: @demo_gem.github, image: @demo_gem.image, name: @demo_gem.name, rubygems: @demo_gem.rubygems }
    assert_redirected_to demo_gem_path(assigns(:demo_gem))
  end

  test "should destroy demo_gem" do
    assert_difference('DemoGem.count', -1) do
      delete :destroy, id: @demo_gem
    end

    assert_redirected_to demo_gems_path
  end
end
