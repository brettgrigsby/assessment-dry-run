require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "is valid" do
    user = User.new(email: "some@email.com", password: "password")
    assert user.valid?
  end

  test "is invalid without email or password" do
    user = User.new(email: nil, password: "password")
    refute user.valid?

    user = User.new(email: "some@email.com", password: nil)
    refute user.valid?
  end

  
end
