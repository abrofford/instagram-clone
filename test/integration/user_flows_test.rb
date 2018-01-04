require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "can see the login page" do
    get "/sessions/new"
    assert_select "h1", "Log In"
  end

  test "can log in with proper credentials" do
    nik = users(:nik)
    get "/sessions/new"
    post "/sessions", params: {user: {email: "nik@techfleet.com", password: "donuts"}}

      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h1", "All Photos"
  end

  test "can see the new user page" do
    get "/users/new"
    assert_select "h1", "SIGN UP FOR INSTAGRAM"
  end

  test "can sign up with proper credentials" do
    get "/users/new"
    post "/users", params: {user: {email: "nik@techfleet.com", password: "donuts", first_name: "nik", last_name: "kovak"}}

      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h1", "All Photos"
  end

  test "can edit user with proper credentials" do
    nik = users(:nik)
    get "/sessions/new"
    post "/sessions", params: {user: {email: "nik@techfleet.com", password: "donuts"}}

      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h1", "All Photos"

    get "/users/#{nik.id}/edit"
    put "/users/#{nik.id}", params: {user: {first_name: "mnik", last_name: "nkovak"}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "h1", "Edit your profile"
  end
end
