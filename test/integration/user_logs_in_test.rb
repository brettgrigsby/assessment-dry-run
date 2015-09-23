class UserLogsInTest < ActionDispatch::IntegrationTest

  test "user visits home page" do
    https!
    get '/'

    assert_response :success
  end

  test "user logs in" do
    user = User.create(email: "test@test.com", password: "password")

    https!
    get '/'

    post_via_redirect "/sessions", {user: {email: "test@test.com", password: "password"}}

    assert_equal "/users/#{user.id}", path
  end

end
