require 'test_helper'

class LyftAuthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lyft_auth = lyft_auths(:one)
  end

  test "should get index" do
    get lyft_auths_url, as: :json
    assert_response :success
  end

  test "should create lyft_auth" do
    assert_difference('LyftAuth.count') do
      post lyft_auths_url, params: { lyft_auth: { token: @lyft_auth.token } }, as: :json
    end

    assert_response 201
  end

  test "should show lyft_auth" do
    get lyft_auth_url(@lyft_auth), as: :json
    assert_response :success
  end

  test "should update lyft_auth" do
    patch lyft_auth_url(@lyft_auth), params: { lyft_auth: { token: @lyft_auth.token } }, as: :json
    assert_response 200
  end

  test "should destroy lyft_auth" do
    assert_difference('LyftAuth.count', -1) do
      delete lyft_auth_url(@lyft_auth), as: :json
    end

    assert_response 204
  end
end
