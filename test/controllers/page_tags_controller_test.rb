require 'test_helper'

class PageTagsControllerTest < ActionController::TestCase
  setup do
    @page_tag = page_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_tag" do
    assert_difference('PageTag.count') do
      post :create, page_tag: { page_id: @page_tag.page_id, tag_id: @page_tag.tag_id }
    end

    assert_redirected_to page_tag_path(assigns(:page_tag))
  end

  test "should show page_tag" do
    get :show, id: @page_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_tag
    assert_response :success
  end

  test "should update page_tag" do
    patch :update, id: @page_tag, page_tag: { page_id: @page_tag.page_id, tag_id: @page_tag.tag_id }
    assert_redirected_to page_tag_path(assigns(:page_tag))
  end

  test "should destroy page_tag" do
    assert_difference('PageTag.count', -1) do
      delete :destroy, id: @page_tag
    end

    assert_redirected_to page_tags_path
  end
end
