require 'test_helper'

class PageDomainsControllerTest < ActionController::TestCase
  setup do
    @page_domain = page_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_domain" do
    assert_difference('PageDomain.count') do
      post :create, page_domain: { domain_id: @page_domain.domain_id, page_id: @page_domain.page_id }
    end

    assert_redirected_to page_domain_path(assigns(:page_domain))
  end

  test "should show page_domain" do
    get :show, id: @page_domain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_domain
    assert_response :success
  end

  test "should update page_domain" do
    patch :update, id: @page_domain, page_domain: { domain_id: @page_domain.domain_id, page_id: @page_domain.page_id }
    assert_redirected_to page_domain_path(assigns(:page_domain))
  end

  test "should destroy page_domain" do
    assert_difference('PageDomain.count', -1) do
      delete :destroy, id: @page_domain
    end

    assert_redirected_to page_domains_path
  end
end
